import 'package:flutter/material.dart';

class CommitteesProvider with ChangeNotifier {
  // قائمة اللجان
  List<Map<String, dynamic>> _committees = [];

  List<Map<String, dynamic>> get committees => _committees;

  // إضافة لجنة
  void addCommittee(Map<String, dynamic> committee) {
    _committees.add(committee);
    notifyListeners(); // إعلام المستمعين بوجود تغيير
  }

  // تعديل لجنة
  void editCommittee(int index, Map<String, dynamic> updatedCommittee) {
    _committees[index] = updatedCommittee;
    notifyListeners(); // إعلام المستمعين بوجود تغيير
  }

  // حذف لجنة
  void deleteCommittee(int index) {
    _committees.removeAt(index);
    notifyListeners(); // إعلام المستمعين بوجود تغيير
  }
}
