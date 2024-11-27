import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/ActivityCard.dart';

class main_activity_page extends StatefulWidget {
  const main_activity_page({super.key});

  @override
  State<main_activity_page> createState() => _nameState();
}

class _nameState extends State<main_activity_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Page'),
        automaticallyImplyLeading: false,
      ),
      body: ActivityCard(
        isAdmin: true,
      ),
    );
  }
}
