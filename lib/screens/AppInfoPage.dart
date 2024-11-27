import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 147, 234, 211),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'App Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'App Name: Sakani.app',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Version: 3.5.4',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SingleChildScrollView(
                          child: Text(
                            'Developed by: Mohammed zaki\n Alwleed Al-taremey\n Mohammad salameen\n Ahmed mokharg\n Yayha bawzeer\n\n ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SingleChildScrollView(
                          child: Text(
                            'Description: This app is designed to manage activities and committees efficiently.\n Whether you are an administrator or a regular user\n, it offers a comprehensive platform to create,\n edit, and track various activities and committees.\n The app allows admins to add and modify activities,\n while users can view details about these activities and participate in committees.\n Key features include an intuitive interface,\n seamless navigation, and real-time updates,\n making it easier for users to stay informed and engaged.\n The goal of this app is to simplify the management process and enhance collaboration among team members,...\n\n',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal, // خلفية الزر
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              // عند الضغط على الزر، ستظهر نافذة الحوار
                              _showAppInfoDialog(context);
                            },
                            child: const Text(
                              'Show More Details',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لعرض صندوق حوار عند الضغط على الزر
  void _showAppInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text('App Information'),
            content: const Text(
              'App Name: Sakani.appn'
              'Version: 1.0.0\n'
              'Developed by: Mohammed zaki\n Alwleed Al-taremey\n Mohammad salameen\n Ahmed mokharg\n Yayha bawzeer\n\n\n '
              'This app is designed to manage activities and committees efficiently.\n\n Whether you are an administrator or a regular user\nit offers a comprehensive platform to create,edit,\n and track various activities and committees.\n\n The app allows admins to add and modify activities,while users can view details about these activities and participate in committees.\n\n Key features include an intuitive interface,seamless navigation, and real-time updates, making it easier for users to stay informed and engaged.\n\n The goal of this app is to simplify the management process and enhance collaboration among team members,making it a valuable tool for both personal and professional use.',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // إغلاق صندوق الحوار
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
