import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final List? TextInputFormatter;
  // final String? User_Name;
  // final String? Passwoord;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.validator,
      this.readOnly = false,
      this.TextInputFormatter,
      List<FilteringTextInputFormatter>? inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      ),
      validator: validator,
    );
  }
}
