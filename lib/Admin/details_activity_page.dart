import 'package:flutter/material.dart';

class ActivityDetailsPage extends StatelessWidget {
  final Map<String, dynamic> activity;
  const ActivityDetailsPage({super.key, required this.activity, required name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Activity Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Activity Name: ${activity['name']}'),
            const SizedBox(height: 10),
            Text('Activity Description: ${activity['description']}'),
            const SizedBox(height: 8),
            Text('Start Time: ${activity['start_time']}'),
            const SizedBox(height: 8),
            Text('End Time: ${activity['end_time']}'),
            const SizedBox(height: 50),
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
