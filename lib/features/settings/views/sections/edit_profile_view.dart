import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/models/user_model.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/widgets/custom_send_button.dart';
import 'package:my_visitor/core/widgets/custom_app_bar.dart';
import 'package:my_visitor/features/settings/views/widgets/profile_utils.dart';
import 'package:my_visitor/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

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
  XFile? _profileImage;
  bool _isLoading = false;
  final ProfileUtils _userService = ProfileUtils();
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    _checkUserAndLoadInfo();
  }

  Future<void> _checkUserAndLoadInfo() async {
    if (FirebaseAuth.instance.currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, LoginView.id);
      });
      return;
    }
    await loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final userModel = await _userService.loadUserData();
      setState(() {
        this.userModel = userModel;
        if (userModel != null) {
          _nameController.text = userModel.name ?? '';
          _phoneController.text = userModel.phoneNumber ?? '';
        }
      });
    } catch (e) {
      log('Error loading user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load user data')),
      );
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
        log('Image picked: ${pickedFile.path}, size: ${File(pickedFile.path).lengthSync()} bytes');
      });
    } else {
      log('No image selected');
    }
  }

  Future<String?> _uploadImage({required XFile image}) async {
    try {
      File file = File(image.path);
      String fileName =
          'profile-images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      log('Uploading image to Supabase: $fileName, size: ${await file.length()} bytes');
      await supa.Supabase.instance.client.storage
          .from('profile-images')
          .upload(fileName, file);
      final String publicUrl = supa.Supabase.instance.client.storage
          .from('profile-images')
          .getPublicUrl(fileName);
      log('Image uploaded successfully: $publicUrl');
      return publicUrl;
    } catch (e) {
      log('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload image')),
      );
      return null;
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      log('Form validation failed');
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      String? newProfileImageUrl = userModel?.image;
      if (_profileImage != null) {
        newProfileImageUrl = await _uploadImage(image: _profileImage!);
        if (newProfileImageUrl == null) {
          log('Image upload failed, keeping existing image URL');
        }
      }
      final currnetuser = FirebaseAuth.instance.currentUser!.email;
      final updatedModel = UserModel(
        name: _nameController.text.trim(),
        email: currnetuser!,
        phoneNumber: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        image: newProfileImageUrl,
      );

      await _userService.updateProfile(updatedModel);
      log('Profile saved successfully');
     
      Navigator.pop(context, true);
       _userService.refreshProfile();
    } catch (e) {
      log('Error saving profile: $e');
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

  // Helper function to validate URL
  bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasAbsolutePath &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(child: LoadingWidgets.loadingprogressiveDots())
          : userModel == null
              ? Center(child: LoadingWidgets.loadingthreeRotatingDots(size: 60))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomAppBar(title: s.edit_profile),
                          GestureDetector(
                            onTap: _pickImage,
                            child: _profileImage != null
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundColor: orangeColor,
                                    backgroundImage:
                                        FileImage(File(_profileImage!.path)),
                                  )
                                : userModel!.image == null ||
                                        userModel!.image!.isEmpty ||
                                        !isValidUrl(userModel!.image)
                                    ? CircleAvatar(
                                        radius: 45,
                                        backgroundColor: orangeColor,
                                        backgroundImage: const AssetImage(
                                            AppConstants.defaultProfileImage),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: userModel!.image!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                CircleAvatar(
                                          radius: 45,
                                          backgroundColor: orangeColor,
                                          backgroundImage: imageProvider,
                                        ),
                                        placeholder: (context, url) =>
                                            CircleAvatar(
                                          radius: 45,
                                          backgroundColor: orangeColor,
                                          child: LoadingWidgets
                                              .loadingthreeRotatingDots(
                                                  size: 30),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                          radius: 45,
                                          backgroundColor: orangeColor,
                                          backgroundImage: const AssetImage(
                                              AppConstants.defaultProfileImage),
                                        ),
                                      ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextFrom(
                            label: s.full_name,
                            hint: s.full_name,
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return s.please_enter_your_name;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFrom(
                            label: s.email,
                            hint: userModel!.email ?? s.email,
                            enabled: false,
                            initialValue: userModel!.email,
                          ),
                          const SizedBox(height: 20),
                          CustomTextFrom(
                            label: s.phone_number,
                            hint: s.phone_number,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value != null && value.trim().isNotEmpty) {
                                if (!RegExp(r'^\d{10,15}$')
                                    .hasMatch(value.trim())) {
                                  return s.please_enter_valid_phone;
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomSendButton(
                            label: s.save,
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
        border: OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black),
  borderRadius: const BorderRadius.all(Radius.circular(16)),
),

      ),
      validator: validator,
    );
  }
}
