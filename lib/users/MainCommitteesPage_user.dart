import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CommitteesCard.dart';

class MainCommitteesPage_user extends StatelessWidget {
  const MainCommitteesPage_user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Committees Page'),
        automaticallyImplyLeading: false,
      ),
      body: CommitteesCard(
        isAdmin: false,
      ),
    );
  }
}
