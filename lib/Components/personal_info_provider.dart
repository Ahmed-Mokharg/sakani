import 'package:flutter/foundation.dart';

class PersonalInfoProvider with ChangeNotifier {
  String? username;
  String? email;
  String? password;
  String? dateOfBirth;
  String? specialization;
  String? phone;
  String? age;

  void updatePersonalInfo({
    String? username,
    String? email,
    String? password,
    String? dateOfBirth,
    String? specialization,
    String? phone,
    String? age,
  }) {
    this.username = username;
    this.email = email;
    this.password = password;
    this.dateOfBirth = dateOfBirth;
    this.specialization = specialization;
    this.phone = phone;
    this.age = age;

    // Notify listeners to rebuild UI when data changes
    notifyListeners();
  }

  bool hasData() {
    return username != null ||
        email != null ||
        password != null ||
        dateOfBirth != null ||
        specialization != null ||
        phone != null ||
        age != null;
  }
}
