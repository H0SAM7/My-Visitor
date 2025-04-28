import 'dart:developer';
import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/ML/data/models/detection_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

abstract class LocalModelDataSource {
  List<DetectionModel> fetchAllData();
}

class LocalModelDataSourceImpl extends LocalModelDataSource {
  @override
  List<DetectionModel> fetchAllData() {
    try {
      var box = Hive.box<DetectionModel>(kMlData);
      List<DetectionModel> allData = box.values.toList();

      return allData;
    } catch (e) {
      log('#######################  err to fetch hotels from hive');
      log(e.toString());
      return [];
    }
  }
}
