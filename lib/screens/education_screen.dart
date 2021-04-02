import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';

class EducationScreen extends StatefulWidget {
  static const String id = 'education_screen';

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "Education"),
      bottomNavigationBar: CustomBottomNavigationBar(screenId: EducationScreen.id),
    );
  }
}
