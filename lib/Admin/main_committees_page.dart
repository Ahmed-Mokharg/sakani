import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CommitteesCard.dart';
// ignore: unused_import
// import 'package:shared_preferences/shared_preferences.dart';

class main_committees_page extends StatefulWidget {
  const main_committees_page({super.key});

  @override
  State<main_committees_page> createState() => _main_committees_pageState();
}

class _main_committees_pageState extends State<main_committees_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Committees Pages'),
        automaticallyImplyLeading: false,
      ),
      body: CommitteesCard(isAdmin: true),
    );
  }
}
