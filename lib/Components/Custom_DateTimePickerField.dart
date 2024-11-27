import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/custom_text_form_field.dart';

class DateTimePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;

  const DateTimePickerField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.validator,
  });

  @override
  State<DateTimePickerField> createState() => _DateTimePickerFieldState();
}

class _DateTimePickerFieldState extends State<DateTimePickerField> {
  Future<void> _pickDateTime() async {
    // Pick a date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Pick a time
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine date and time
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Format as string and update controller
        setState(() {
          widget.controller.text = pickedDateTime.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      prefixIcon: widget.prefixIcon,
      readOnly: true, // Prevent manual input
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_today),
        onPressed: _pickDateTime,
      ),
      validator: widget.validator,
    );
  }
}
