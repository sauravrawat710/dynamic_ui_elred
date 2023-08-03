import '../models/gamification_model.dart';
import 'package:flutter/services.dart';

class GamificationService {
  static Future<GamificationModel> fetchJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');

    final dynamicModel = gamificationFromMap(response);

    return dynamicModel;
  }
}
