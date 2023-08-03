import 'package:flutter/material.dart';

import '../models/gamification_model.dart';

class GamificationViewModel extends ChangeNotifier {
  late GamificationModel response;

  int _currentIndex = 0;
  double _progress = 0.0;

  int get currentIndex => _currentIndex;
  double get progress => _progress;

  List<Screen> get parentScreens => _parentScreens;
  Screen get currentScreen => _parentScreens[_currentIndex];
  List<Screen> _parentScreens = const [];

  bool _showSummary = false;
  bool get showSummary => _showSummary;

  String name = '';
  String gender = '';
  DateTime? dob;
  String profession = '';
  String develop = '';

  void reset() {
    name = '';
    gender = '';
    dob = null;
    profession = '';
    develop = '';
    _currentIndex = 0;
    _progress = 0.0;
    _showSummary = false;
    notifyListeners();
  }

  void setResponseAndScreen(GamificationModel model) {
    response = model;
    _parentScreens = response.screens;
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

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void incrementIndex() {
    if (currentScreen.childScreen != null) {
      if (profession == 'a frontend developer') {
        _parentScreens.addAll(currentScreen.childScreen!.frontend);
        _currentIndex++;
        _progress += 0.20;
        notifyListeners();
      }
      if (profession == 'a backend developer') {
        _parentScreens.addAll(currentScreen.childScreen!.backend);
        _currentIndex++;
        _progress += 0.20;
        notifyListeners();
      }
      if (profession == 'a UI/UX designer') {
        _parentScreens.addAll(currentScreen.childScreen!.designer);
        _currentIndex++;
        _progress += 0.20;
        notifyListeners();
      }
    } else if (_currentIndex == parentScreens.length - 1) {
      _showSummary = true;
      _progress = 1.0;
      notifyListeners();
    } else if (_currentIndex < parentScreens.length - 1) {
      _currentIndex++;
      _progress += 0.20;
      notifyListeners();
    }
  }

  void decrementIndex() {
    if (currentScreen.screenName == 'technology') {
      _parentScreens
          .removeWhere((element) => element.screenName == 'technology');
      _currentIndex--;
      _progress -= 0.20;
      notifyListeners();
    } else if (_currentIndex > 0) {
      _currentIndex--;
      _progress -= 0.20;
      notifyListeners();
    }
  }
}
