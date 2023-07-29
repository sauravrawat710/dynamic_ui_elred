import 'package:dynamic_elred/models/dynamic.dart';
import 'package:dynamic_elred/presentation/screens/backend_screen.dart';
import 'package:dynamic_elred/presentation/screens/frontend_screen.dart';
import 'package:dynamic_elred/presentation/screens/name_screen.dart';
import 'package:dynamic_elred/presentation/screens/profession_screen.dart';
import 'package:dynamic_elred/presentation/screens/gender_screen.dart';
import 'package:dynamic_elred/presentation/screens/summary_screen.dart';
import 'package:dynamic_elred/presentation/screens/dob_screen.dart';
import 'package:dynamic_elred/presentation/screens/ui_ux_screen.dart';
import 'package:dynamic_elred/services/gamification_service.dart';
import 'package:flutter/material.dart';

class GamificationProvider extends ChangeNotifier {
  GamificationProvider() {
    GamificationService.fetchJson().then((value) => response = value);
  }

  late Dynamic response;

  int _currentIndex = 0;
  double _progress = 0.0;

  int get currentIndex => _currentIndex;
  double get progress => _progress;

  List<Widget> get screens => _screens;
  Widget get currentScreen => _screens[_currentIndex];

  String name = '';
  String gender = '';
  DateTime? dob;
  String profession = '';
  String develop = '';
  String backendTechStack = '';
  String uiux = '';

  void reset() {
    name = '';
    gender = '';
    dob = null;
    profession = '';
    develop = '';
    backendTechStack = '';
    uiux = '';
    _currentIndex = 0;
    _progress = 0.0;
    notifyListeners();
  }

  void onNameChanged(String value) {
    name = value;
    notifyListeners();
  }

  void onGenderChange(String value) {
    gender = value;
    notifyListeners();
  }

  void onDobChanged(DateTime value) {
    dob = value;
    notifyListeners();
  }

  void onProfessionChanged(String value) {
    profession = value;
    notifyListeners();
  }

  void onDevelopChanged(String value) {
    develop = value;
    notifyListeners();
  }

  void onBackendTechStackChanged(String value) {
    backendTechStack = value;
    notifyListeners();
  }

  void onUIUXChanged(String value) {
    uiux = value;
    notifyListeners();
  }

  final List<Widget> _screens = const [
    NameScreen(),
    GenderScreen(),
    DobScreen(),
    ProfessionScreen(),
    FrontendScreen(),
    BackendScreen(),
    UXScreen(),
    SummaryScreen(),
  ];

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void incrementIndex() {
    if (_currentIndex < 8) {
      _currentIndex++;
      _progress += 0.20;
      notifyListeners();
    }
  }

  void decrementIndex() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _progress -= 0.20;
      notifyListeners();
    }
  }
}
