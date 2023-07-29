import 'package:dynamic_elred/models/dynamic.dart';
import 'package:flutter/services.dart';

class GamificationService {
  static Future<Dynamic> fetchJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');

    final dynamicModel = dynamicFromMap(response);

    return dynamicModel;
  }
}
