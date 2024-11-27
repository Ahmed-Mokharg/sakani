import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/custom_password.dart';
import 'package:flutter_application_1/Components/custom_text_form_field.dart';
import 'package:flutter_application_1/Register_Pages/signup.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false; // لإظهار مؤشر تحميل

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FF),
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color(0xFF2B6CB0), // أزرق داكن
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name Field
                    CustomTextFormField(
                      controller: nameController,
                      labelText: "Name",
                      hintText: "Enter your name",
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your name.";
                        } else if (!RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$')
                            .hasMatch(value)) {
                          return "Name must start with a letter and contain letters and numbers";
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

                    // Login Button
                    isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF2B6CB0), // أزرق داكن
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await Future.delayed(const Duration(
                                    seconds: 2)); // محاكاة انتظار
                                setState(() {
                                  isLoading = false;
                                });

                                final userModel = Provider.of<UserModel>(
                                    context,
                                    listen: false);
                                await userModel.updateUser(
                                  username: nameController.text,
                                  email: "",
                                  password: passwordController.text,
                                  dateOfBirth: "",
                                  specialization: "",
                                  phone: "",
                                  age: "",
                                );

                                final isAdmin =
                                    nameController.text == "admin" &&
                                        passwordController.text == "123456789";

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(isAdmin: isAdmin),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                    const SizedBox(height: 15),

                    // Navigate to Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) {
                              return const SignUp();
                            }));
                          },
                          child: const Text(
                            ' Sign Up',
                            style: TextStyle(
                              color: Color(0xFF2B6CB0),
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
        ),
      ),
    );
  }
}
