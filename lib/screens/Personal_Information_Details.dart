import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import 'home_page.dart';

class PersonalInformationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الحصول على البيانات من UserModel باستخدام Provider
    final user = Provider.of<UserModel>(context);

    final bool hasData = user.username.isNotEmpty &&
        user.email.isNotEmpty &&
        user.password.isNotEmpty &&
        user.dateOfBirth.isNotEmpty &&
        user.specialization.isNotEmpty &&
        user.phone.isNotEmpty &&
        user.age.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage(
                        isAdmin: false,
                      )),
              (route) => false, // يزيل جميع الصفحات السابقة
            );
          },
        ),
      ),
      body: hasData
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildInfoRow("Username", user.username),
                      const Divider(),
                      _buildInfoRow("Email", user.email),
                      const Divider(),
                      _buildInfoRow("Password", user.password),
                      const Divider(),
                      _buildInfoRow("Date of Birth", user.dateOfBirth),
                      const Divider(),
                      _buildInfoRow("Specialization", user.specialization),
                      const Divider(),
                      _buildInfoRow("Phone", user.phone),
                      const Divider(),
                      _buildInfoRow("Age", user.age),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: Text(
                "No information available currently.",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
