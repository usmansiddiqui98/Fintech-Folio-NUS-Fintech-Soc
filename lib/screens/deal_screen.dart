import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';

class DealScreen extends StatefulWidget {
  static const String id = 'deal_screen';

  @override
  _DealScreenState createState() => _DealScreenState();
}

class _DealScreenState extends State<DealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "Deals"),
      bottomNavigationBar: CustomBottomNavigationBar(screenId: DealScreen.id),
    );
  }
}
