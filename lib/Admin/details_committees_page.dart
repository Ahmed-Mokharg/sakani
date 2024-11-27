import 'package:flutter/material.dart';

class CommitteesDetailsPage extends StatelessWidget {
  final String? name;
  final String? image;
  final Map<String, dynamic>? activity;

  const CommitteesDetailsPage({
    super.key,
    this.name,
    this.image,
    this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Activity Title: ${activity?['name']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Activity Description: ${activity?['description']}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
