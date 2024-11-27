import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/add_activity_page.dart';
import 'package:flutter_application_1/Admin/details_activity_page.dart';
import 'package:flutter_application_1/Admin/edit_activity_page.dart';
import 'package:flutter_application_1/Components/ActivityProvider.dart';
import 'package:flutter_application_1/Components/Custom_DateTimePickerField.dart';

import 'package:provider/provider.dart';

class ActivityCard extends StatelessWidget {
  final bool isAdmin; // To determine if the user is Admin or normal user

  ActivityCard({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add new activity button (only visible if the user is Admin)
        if (isAdmin)
          ElevatedButton(
            onPressed: () async {
              final newActivity = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddActivityPage()),
              );
              if (newActivity != null) {
                // Add new activity using ActivityProvider
                Provider.of<ActivityProvider>(context, listen: false)
                    .addActivity(newActivity);
              }
            },
            child: const Text('Add Activity'),
          ),
        SizedBox(height: 50),
        // Card to display activities
        Expanded(
          child: Consumer<ActivityProvider>(
            builder: (context, activityProvider, child) {
              return ListView.builder(
                itemCount: activityProvider.activities.length,
                itemBuilder: (context, index) {
                  final activity = activityProvider.activities[index];
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Activity name
                          const Text(
                            'Title of activity: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            activity['name'] ?? 'Activity title not available',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Activity description
                          const Text(
                            'Description of activity: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            activity['description'] ??
                                'Activity description not available',
                          ),
                          const SizedBox(height: 10),

                          // Activity Start
                          const Text(
                            'Start of activity: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            activity['Start'] ?? 'Activity Start not available',
                          ),
                          const SizedBox(height: 10),

                          // Activity End
                          const Text(
                            'End of activity: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            activity['End'] ?? 'Activity End not available',
                          ),

                          // Action buttons (view, edit, delete)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.info),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ActivityDetailsPage(
                                        name: activity['name'],
                                        activity: activity,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // Edit button (only visible if the user is Admin)
                              if (isAdmin)
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    final updatedActivity =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditActivityPage(
                                          activity: activity,
                                          name: activity['name'],
                                        ),
                                      ),
                                    );

                                    if (updatedActivity != null) {
                                      Provider.of<ActivityProvider>(context,
                                              listen: false)
                                          .updateActivity(
                                              activity['id'], updatedActivity);
                                    }
                                  },
                                ),

                              // Delete button (only visible if the user is Admin)
                              if (isAdmin)
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    Provider.of<ActivityProvider>(context,
                                            listen: false)
                                        .deleteActivity(index);
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
