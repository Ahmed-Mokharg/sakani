import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/add_committees_page.dart';
import 'package:flutter_application_1/Admin/details_committees_page.dart';
import 'package:flutter_application_1/Admin/edit_committees_page.dart';
import 'package:flutter_application_1/Components/CommitteesProvider.dart';
import 'package:provider/provider.dart';

class CommitteesCard extends StatelessWidget {
  final bool isAdmin; // لتحديد نوع المستخدم (إداري أو عادي)

  CommitteesCard({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // زر إضافة لجنة جديدة (يظهر فقط إذا كان المستخدم Admin)
        if (isAdmin)
          ElevatedButton(
            onPressed: () async {
              final newCommittee = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCommitteesPage()),
              );
              if (newCommittee != null) {
                // إضافة اللجنة الجديدة باستخدام CommitteesProvider
                Provider.of<CommitteesProvider>(context, listen: false)
                    .addCommittee(newCommittee);
              }
            },
            child: const Text('Add Committee'),
          ),

        const SizedBox(
            height: 20), // To create some spacing between the button and list

        // Card لعرض اللجان
        Expanded(
          child: Consumer<CommitteesProvider>(
            builder: (context, committeesProvider, child) {
              return ListView.builder(
                itemCount: committeesProvider.committees.length,
                itemBuilder: (context, index) {
                  final committee = committeesProvider.committees[index];
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // اسم اللجنة
                          const Text(
                            'Committee Name: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            committee['name'] ?? 'Committee name not available',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // وصف اللجنة
                          const Text(
                            'Description of Committee: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            committee['description'] ??
                                'No description available',
                          ),

                          const SizedBox(height: 10),

                          // أزرار التفاعل
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // زر التفاصيل
                              IconButton(
                                icon: const Icon(Icons.info),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CommitteesDetailsPage(
                                        name: committee['name'],
                                        image: committee['image'],
                                        activity: committee,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // زر التعديل (يظهر فقط إذا كان المستخدم Admin)
                              if (isAdmin)
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditCommitteesPage(
                                          name: committee['name'],
                                          image: committee['image'],
                                          activity: committee,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              // زر الحذف (يظهر فقط إذا كان المستخدم Admin)
                              if (isAdmin)
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    Provider.of<CommitteesProvider>(context,
                                            listen: false)
                                        .deleteCommittee(index); // حذف اللجنة
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
