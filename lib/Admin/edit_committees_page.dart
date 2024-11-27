import 'package:flutter/material.dart';

class EditCommitteesPage extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  EditCommitteesPage({
    super.key,
    required String name,
    String? image,
    required Map<String, dynamic> activity,
  })  : titleController = TextEditingController(text: activity['name']),
        descriptionController =
            TextEditingController(text: activity['description']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Activity Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration:
                  const InputDecoration(labelText: 'Activity Description'),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedActivity = {
                  'name': titleController.text,
                  'description': descriptionController.text,
                };
                Navigator.pop(context, updatedActivity);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
