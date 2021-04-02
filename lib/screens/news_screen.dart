import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';

class NewsScreen extends StatefulWidget {
  static const String id = 'news_screen';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "News"),
      bottomNavigationBar: CustomBottomNavigationBar(screenId: NewsScreen.id),
    );
  }
}
