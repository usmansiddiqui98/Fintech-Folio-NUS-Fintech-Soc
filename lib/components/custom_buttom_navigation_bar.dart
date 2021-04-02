import 'package:flutter/material.dart';
import '../screens/news_screen.dart';
import '../screens/deal_screen.dart';
import '../screens/education_screen.dart';
import '../screens/finance_screen.dart';
import '../screens/summary_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String screenId;

  CustomBottomNavigationBar({Key key, this.screenId}) : super(key: key);

  final List<String> screenIdList = [
    NewsScreen.id,
    DealScreen.id,
    SummaryScreen.id,
    FinanceScreen.id,
    EducationScreen.id
  ];

  int _getCurrentIndex() {
    for (int i = 0; i < this.screenIdList.length; i += 1) {
      if (this.screenIdList[i] == this.screenId) {
        return i;
      }
    }
    //TODO: Fix this later
    //return 2 for Home if cannot find,
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Tab(icon: Image.asset("assets/icons/news.png")),
            activeIcon: Tab(icon: Image.asset("assets/icons/news_active.png")),
            label: "News"),
        BottomNavigationBarItem(
            icon: Tab(icon: Image.asset("assets/icons/deals.png")),
            activeIcon: Tab(icon: Image.asset("assets/icons/deals_active.png")),
            label: "Deals"),
        BottomNavigationBarItem(
            icon: Tab(icon: Image.asset("assets/icons/home.png")),
            activeIcon: Tab(icon: Image.asset("assets/icons/home_active.png")),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Tab(icon: Image.asset("assets/icons/finances.png")),
            activeIcon:
                Tab(icon: Image.asset("assets/icons/finances_active.png")),
            label: "Finances"),
        BottomNavigationBarItem(
            icon: Tab(icon: Image.asset("assets/icons/education.png")),
            activeIcon:
                Tab(icon: Image.asset("assets/icons/education_active.png")),
            label: "Education"),
      ],
      currentIndex: _getCurrentIndex(),
      selectedItemColor: Color(0xFF7D9CED),
      onTap: (index) {
        Navigator.pushReplacementNamed(context, screenIdList[index]);
      },
    );
  }
}
