import 'package:flutter/material.dart';

class ActivityProvider with ChangeNotifier {
  List<Map<String, dynamic>> _activities = [];

  List<Map<String, dynamic>> get activities => _activities;

  void addActivity(Map<String, dynamic> activity) {
    _activities.add(activity);
    notifyListeners();
  }

  void editActivity(int index, Map<String, dynamic> updatedActivity) {
    _activities[index] = updatedActivity;
    notifyListeners();
  }

  void deleteActivity(int index) {
    _activities.removeAt(index);
    notifyListeners();
  }

  void updateActivity(int id, Map<String, dynamic> updatedActivity) {
    final index = _activities.indexWhere((activity) => activity['id'] == id);

    if (index != -1) {
      _activities[index] = updatedActivity; // تحديث النشاط
      notifyListeners(); // إعلام واجهة المستخدم بتحديث النشاط
    } else {
      print("Activity not found for update");
    }
  }
}
