import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_visitor/features/settings/views/sections/personal_info_view.dart';
import 'package:my_visitor/features/settings/views/widgets/profile_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import 'package:my_visitor/core/utils/shared_pref.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/widgets/custom_send_button.dart';
import 'package:my_visitor/core/widgets/custom_app_bar.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});
  static String id = 'EditProfileView';

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _email;
  XFile? _profileImage; // Temporary holder for picked image
  String? _profileImageUrl; // URL from Firestore or Supabase
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkUserAndLoadInfo();
  }

  Future<void> _checkUserAndLoadInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      developer.log('No user logged in, redirecting to login');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, LoginView.id);
      });
      return;
    }
    await _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Map<String, dynamic> profile = await ProfileUtils.getUserProfile();
      setState(() {
        _email = profile['email'];
        _nameController.text = profile['username'];
        _phoneController.text = profile['phone'];
        _profileImageUrl = profile['profileImageUrl'];
      });
      developer.log('Loaded profileImageUrl: $_profileImageUrl');
    } catch (e) {
      developer.log('Error loading user info: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load user info')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
        developer.log('Image picked: ${pickedFile.path}');
      });
    } else {
      developer.log('No image selected');
    }
  }

  Future<String> _uploadImage({required XFile image}) async {
    try {
      File file = File(image.path);
      String fileName = "profileImages/${DateTime.now().millisecondsSinceEpoch}.jpg";
      developer.log('Uploading image to Supabase: $fileName');
      await supa.Supabase.instance.client.storage
          .from('profileImages')
          .upload(fileName, file);
      final String publicUrl = supa.Supabase.instance.client.storage
          .from('profileImages')
          .getPublicUrl(fileName);
      setState(() {
        _profileImageUrl = publicUrl; // Update UI with new URL
      });
      developer.log('✅ Image uploaded: $publicUrl');
      return publicUrl;
    } catch (e) {
      developer.log('❌ Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload image')),
      );
      return "";
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      developer.log('Form validation failed');
      return;
    }
    setState(() {
      _isLoading = true;
    });
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) {
      developer.log('No user logged in or email is null');
      Navigator.pushNamed(context, LoginView.id);
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      String? newProfileImageUrl = _profileImageUrl;
      if (_profileImage != null && (_profileImageUrl == null || !_profileImageUrl!.startsWith('http'))) {
        developer.log('Attempting to upload new image');
        newProfileImageUrl = await _uploadImage(image: _profileImage!);
        if (newProfileImageUrl.isEmpty) {
          developer.log('Image upload failed, continuing with existing image URL');
          newProfileImageUrl = _profileImageUrl;
        }
      }
      await FirebaseFirestore.instance.collection('users').doc(user.email).set({
        'email': user.email,
        'username': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        if (newProfileImageUrl != null && newProfileImageUrl.isNotEmpty && newProfileImageUrl.startsWith('http'))
          'profileImageUrl': newProfileImageUrl,
      }, SetOptions(merge: true));
      developer.log('Firestore update successful');
      Map<String, String> userInfo = {
        'username': _nameController.text.trim(),
        'email': user.email!,
        'phone': _phoneController.text.trim(),
        'profileImageUrl': newProfileImageUrl ?? AppConstants.defaultProfileImage,
      };
      await SharedPreference().setString(user.email!, jsonEncode(userInfo));
      await user.updateDisplayName(_nameController.text.trim());
      developer.log('Profile save successful');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      developer.log('Error saving profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save profile: $e')),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(child: LoadingWidgets.loadingprogressiveDots())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomAppBar(title: 'Edit Profile'),
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.orange,
                          backgroundImage: _profileImage != null
                              ? FileImage(File(_profileImage!.path)) // Preview picked image
                              : (_profileImageUrl != null && _profileImageUrl!.isNotEmpty
                                  ? (_profileImageUrl!.startsWith('http')
                                      ? NetworkImage(_profileImageUrl!)
                                      : AssetImage(_profileImageUrl!)) as ImageProvider
                                  : const AssetImage(AppConstants.defaultProfileImage)),
                          child: (_profileImage == null &&
                                  (_profileImageUrl == null || _profileImageUrl!.isEmpty))
                              ? const Icon(Icons.edit)
                              : null,
                          onBackgroundImageError: (exception, stackTrace) {
                            developer.log('Error loading image: $exception');
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFrom(
                        label: 'Full Name',
                        hint: 'Hosam Adel',
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFrom(
                        label: 'Email',
                        hint: _email ?? AppConstants.defaultEmail,
                        enabled: false,
                        initialValue: _email,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFrom(
                        label: 'Phone Number',
                        hint: '01098894833',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value != null && value.trim().isNotEmpty) {
                            if (!RegExp(r'^\d{10,15}$').hasMatch(value.trim())) {
                              return 'Please enter a valid phone number';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomSendButton(
                        label: 'Save',
                        onTap: _saveProfile,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class CustomTextFrom extends StatelessWidget {
  const CustomTextFrom({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.enabled = true,
    this.initialValue,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? initialValue;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}