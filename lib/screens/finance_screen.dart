import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';


class FinanceScreen extends StatefulWidget {
  static const String id = 'finance_screen';

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "Finances"),
      bottomNavigationBar: CustomBottomNavigationBar(screenId: FinanceScreen.id),
    );
  }
}
