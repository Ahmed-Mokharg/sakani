import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Custom_DatePicker.dart';
import 'package:flutter_application_1/Components/custom_password.dart';
import 'package:flutter_application_1/Components/custom_text_form_field.dart';
import 'package:flutter_application_1/Register_Pages/login.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/home_page.dart';

import 'dart:io';

import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  // Controllers for the form fields
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    return (today.year - birthDate.year) -
        ((today.month < birthDate.month ||
                (today.month == birthDate.month && today.day < birthDate.day))
            ? 1
            : 0);
  }

  /// تحديث حقل العمر عند اختيار تاريخ الميلاد
  void _updateAge(String dateOfBirth) {
    if (dateOfBirth.isNotEmpty) {
      try {
        final parts = dateOfBirth.split('/');
        final DateTime birthDate = DateTime(
          int.parse(parts[2]),
          int.parse(parts[1]),
          int.parse(parts[0]),
        );

        final int age = calculateAge(birthDate);
        ageController.text = age.toString();
      } catch (e) {
        ageController.text = '';
      }
    } else {
      ageController.text = '';
    }
  }

  @override
  void initState() {
    super.initState();

    // تحديث حقل العمر عند تغيير تاريخ الميلاد
    dateOfBirthController.addListener(() {
      _updateAge(dateOfBirthController.text);
    });
  }

  @override
  void dispose() {
    dateOfBirthController.dispose();
    ageController.dispose();
    super.dispose();
  }

  File? selectedImage; // To hold the selected image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // لون رمادي فاتح
      appBar:
          AppBar(title: const Text("Sign Up"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // CustomImagePicker(
                //   defaultText: "No image selected",
                //   imageHeight: 120,
                //   onImageSelected: (image) {
                //     setState(() {
                //       selectedImage = image;
                //     });
                //   },
                // ),
                const SizedBox(height: 20),

                // Name Field
                CustomTextFormField(
                  controller: usernameController,
                  labelText: " User Name",
                  hintText: "Enter User Name",
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name.";
                    } else if (!RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$')
                        .hasMatch(value)) {
                      return "The  user name must start with a letter and contain only letters and numbers.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email Field
                CustomTextFormField(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email.";
                    } else if (!value.contains('@') ||
                        !value.endsWith('.com')) {
                      return "Please enter a valid email address.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password Field
                PasswordField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password.";
                    } else if (value.length <= 6) {
                      return "Password must be at least 6 characters.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Confirm Password Field
                PasswordField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  hintText: "Re-enter your password",
                  prefixIcon: const Icon(Icons.lock),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password.";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Date of Birth Field
                CustomDatePicker(
                  dateController: dateOfBirthController,
                  labelText: "Date of Birth",
                  hintText: "Select your birth date",
                ),
                const SizedBox(height: 5),

                const SizedBox(height: 20),

                // Specialization Field
                CustomTextFormField(
                  controller: specializationController,
                  labelText: "Specialization",
                  hintText: "Enter your specialization",
                  prefixIcon: const Icon(Icons.school),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your specialization.";
                    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return "Specialization can only contain letters.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Phone Field
                CustomTextFormField(
                  controller: phoneController,
                  labelText: "Phone",
                  hintText: "Enter your phone number",
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.school),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone number.";
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Phone number must be numeric (e.g., +967xxxxxxxxx)..";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: ageController,
                  labelText: "Age",
                  hintText: "Your age will appear here",
                  prefixIcon: const Icon(Icons.timeline),
                  readOnly: true, // حقل للعرض فقط
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // لون النص داخل الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // عرض نافذة التحميل
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // منع إغلاق النافذة بالنقر خارجها
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(), // أو SpinKit
                        ),
                      );

                      // محاكاة عملية التسجيل (تأخير 2 ثانية)
                      await Future.delayed(const Duration(seconds: 2));

                      Navigator.of(context).pop(); // إغلاق نافذة التحميل

                      // تحديث بيانات المستخدم
                      Provider.of<UserModel>(context, listen: false).updateUser(
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        dateOfBirth: dateOfBirthController.text,
                        specialization: specializationController.text,
                        phone: phoneController.text,
                        age: ageController.text,
                      );

                      // إظهار رسالة تأكيد التسجيل
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Success"),
                          content:
                              const Text("You have successfully signed up!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // إغلاق التنبيه
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(
                                      isAdmin: false,
                                    ),
                                  ),
                                ); // الانتقال إلى صفحة التفاصيل الشخصية
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                const SizedBox(height: 20),

                // Navigate to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return const Login();
                        }));
                      },
                      child: const Text(
                        ' Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
