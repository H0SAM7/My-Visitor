import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addToFirebase({
    required Map<String, dynamic> data,
    required String collectionName,
  }) async {
    await firestore.collection(collectionName).add(data);
    log('Adding document done ');
  }

  Future<List<Map<String, dynamic>>> fetchFromFirebase({
    required String collectionName,
  }) async {
    QuerySnapshot querySnapshot =
        await firestore.collection(collectionName).get();
    List<Map<String, dynamic>> documents = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    log('Fetching documents done ');
    return documents;
  }



  
  // final ImagePicker _picker = ImagePicker();
  // final SupabaseClient supabase = Supabase.instance.client;
  // String? _imageLink                 ;
  // String? get imageLink => _imageLink;

  // Future<String> uploadImage({required XFile image}) async {
  //   try {
  //     // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     // if (image == null) {
  //     //   throw Exception("لم يتم اختيار صورة");
  //     // }

  //     File file = File(image.path);
  //     String fileName = "images/${DateTime.now().millisecondsSinceEpoch}.jpg";
  //     await supabase.storage.from('images').upload(fileName, file);
  //     final String publicUrl =
  //         supabase.storage.from('images').getPublicUrl(fileName);
  //     _imageLink = publicUrl;
  //     log("✅ تم رفع الصورة وحفظ الرابط بنجاح!");
  //     return publicUrl;
  //   } catch (e) {
  //     log("❌ خطأ: $e");
  //     return ""; 
  //   }
  // }

}
