import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_visitor/core/utils/functions/save_hive_data.dart';

import 'package:my_visitor/features/ML/data/models/detection_model.dart';
import 'package:my_visitor/services/fire_base_services.dart';

abstract class RemoteModelDataSource {
  Future<void> addDataTofirebase(
      {required DetectionModel data, required String collectionName});
  Future<List<DetectionModel>> getData({required String collectionName});
}

class RemoteModelDataSourceImpl extends RemoteModelDataSource {
  final FireBaseServices _firebaseServices = FireBaseServices();

  @override
  Future<void> addDataTofirebase({
    required DetectionModel data,
    required String collectionName,
  }) async {
    await _firebaseServices.addToFirebase(
      collectionName: collectionName,
      data: data.toJson(),
    );
  }

  @override
  Future<List<DetectionModel>> getData({
    required String collectionName,
  }) async {
    final collection = FirebaseFirestore.instance.collection(collectionName).orderBy("id", );
    final snapshot = await collection.get();
final data=snapshot.docs.map((doc) {
      return DetectionModel.fromJson(doc.data());
    }).toList();
    saveMLdataHive(data);
    return data ;
  }
}
