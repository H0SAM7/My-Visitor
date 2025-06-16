import 'dart:convert';
import 'package:flutter/services.dart';
import 'governorate_model.dart';


Future<List<Governorate>> loadGovernorates() async {
  try {
    final String response = await rootBundle.loadString('assets/egypt_governorates_tourism.json');
    final data = jsonDecode(response);
    final List<dynamic> list = data['governorates'];
    return list.map((e) => Governorate.fromJson(e)).toList();
  } catch (e) {
    print('❌ Error loading governorates: $e');
    return [];
  }
}