import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';
import 'package:fintech_folio/functions/user_database.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {

  test() async {
    //Pass in the unique id, "2" is the id for this user for testing
    UserDatabase userdb = new UserDatabase("3");
    //set name and age, if name and age not there yet, will add in, if not
    //if will update name and age
    userdb.setName("Cuong");
    userdb.setAge(21);
    //get back name and age, this will return Future type, so needa know how to
    //work with future type.
    print(await userdb.getName());
    print(await userdb.getAge());

    //This is used to add goal and expenditure,
    //the list of supportet category is under lib/constants.dart file
    //if the category is not supported, exception will be thrown
    userdb.setGoal("NUS Tuition Fee", "Education", 10, 10000);
    userdb.setGoal("Tembusu Fee", "Education", 20, 800);
    userdb.setGoal("BMW", "Transportation", 15, 1400);

    userdb.setExpenditure("Monthly MRT", "Transportation", 80);
    userdb.setExpenditure("Vietnam Trip", "Travel", 3000);

    //Get goal and expediture will return Future<Map>
    print(await userdb.getGoal());
    print(await userdb.getExpenditure());
  }

  @override
  Widget build(BuildContext context) {
    test();

    return Scaffold(
      appBar: GradientAppBar(title: "Summary"),
      bottomNavigationBar: CustomBottomNavigationBar(screenId: SummaryScreen.id),
    );
  }
}
