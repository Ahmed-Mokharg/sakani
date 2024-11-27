import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Custom_DateTimePickerField.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Add activity')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: 'activity Title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter activity title!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'activity Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Description of activity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  DateTimePickerField(
                    controller: startTimeController,
                    labelText: "Start Time",
                    hintText: "Select start time",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select start time';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DateTimePickerField(
                    controller: endTimeController,
                    labelText: "End Time",
                    hintText: "Select end time",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select end time';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newActivity = {
                          'name': _nameController.text,
                          'description': _descriptionController.text,
                          'start_time': startTimeController.text,
                          'end_time': endTimeController.text,
                        };

                        Navigator.pop(context, newActivity);
                      }
                    },
                    child: const Text('Add activity'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
