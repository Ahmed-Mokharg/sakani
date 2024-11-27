import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Custom_DateTimePickerField.dart';
import 'package:flutter_application_1/Components/custom_text_form_field.dart';

class EditActivityPage extends StatefulWidget {
  final Map<String, dynamic> activity;
  final String name;

  const EditActivityPage({
    super.key,
    required this.activity,
    required this.name,
  });

  @override
  _EditActivityPageState createState() => _EditActivityPageState();
}

class _EditActivityPageState extends State<EditActivityPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.activity['name']);
    _descriptionController =
        TextEditingController(text: widget.activity['description']);
    _startTimeController =
        TextEditingController(text: widget.activity['start_time']);
    _endTimeController =
        TextEditingController(text: widget.activity['end_time']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Activity")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _nameController,
              labelText: 'Activity Name',
              hintText: 'Enter activity name',
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _descriptionController,
              labelText: 'Activity Description',
              hintText: 'Enter activity description',
            ),
            const SizedBox(height: 20),
            DateTimePickerField(
              controller: _startTimeController,
              labelText: 'Activity Start Time',
              hintText: 'Select start time',
            ),
            const SizedBox(height: 20),
            DateTimePickerField(
              controller: _endTimeController,
              labelText: 'Activity End Time',
              hintText: 'Select end time',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedActivity = {
                  'id': widget.activity['id'], // Add id for updating
                  'name': _nameController.text,
                  'description': _descriptionController.text,
                  'start_time': _startTimeController.text,
                  'end_time': _endTimeController.text,
                };

                Navigator.pop(
                    context, updatedActivity); // Return the updated activity
              },
              child: const Text('Update Activity'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }
}
