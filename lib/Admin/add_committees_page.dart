import 'package:flutter/material.dart';

class AddCommitteesPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddCommitteesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Committee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Connect the form to the key
            child: Column(
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(labelText: 'Committees Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Committees title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: descriptionController,
                  maxLines: null,
                  decoration: const InputDecoration(
                      labelText: 'Committees Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Committees description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If inputs are valid
                      final activity = {
                        'name': titleController.text,
                        'description': descriptionController.text,
                      };
                      Navigator.pop(context, activity); // Return the activity
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
