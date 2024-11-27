import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel with ChangeNotifier {
  String username = '';
  String email = '';
  String password = '';
  String dateOfBirth = '';
  String specialization = '';
  String phone = '';
  String age = '';

  // تحديث البيانات وحفظها محليًا
  Future<void> updateUser({
    required String username,
    required String email,
    required String password,
    required String dateOfBirth,
    required String specialization,
    required String phone,
    required String age,
  }) async {
    this.username = username;
    this.email = email;
    this.password = password;
    this.dateOfBirth = dateOfBirth;
    this.specialization = specialization;
    this.phone = phone;
    this.age = age;

    // حفظ البيانات في SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('dateOfBirth', dateOfBirth);
    await prefs.setString('specialization', specialization);
    await prefs.setString('phone', phone);
    await prefs.setString('age', age);

    notifyListeners();
  }

  // تحميل البيانات من SharedPreferences
  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username') ?? '';
    email = prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    dateOfBirth = prefs.getString('dateOfBirth') ?? '';
    specialization = prefs.getString('specialization') ?? '';
    phone = prefs.getString('phone') ?? '';
    age = prefs.getString('age') ?? '';
    notifyListeners();
  }
}
