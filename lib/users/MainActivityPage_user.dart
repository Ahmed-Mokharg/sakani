import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/ActivityCard.dart';

class MainActivityPage_user extends StatelessWidget {
  const MainActivityPage_user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Page'),
        automaticallyImplyLeading: false,
      ),
      body: ActivityCard(
        isAdmin: false,
      ),
    );
  }
}
