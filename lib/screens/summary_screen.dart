import 'package:firebase_database/firebase_database.dart'

import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  DatabaseReference _testRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "Summary"),
      bottomNavigationBar: CustomBottomNavigationBar(screenId: SummaryScreen.id),
    );
  }
}
