import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';
import 'package:fintech_folio/functions/user_database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'finance_screen.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
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
      appBar: GradientAppBar(title: "Home"),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Welcome, Pei Ying',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Daily Expenses'),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('dummy value'),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Expenses'),
                    ),
                    // For chart and keys
                    Align(
                      child: SfCircularChart(
                        legend: Legend(isVisible: true),
                        series: <CircularSeries>[
                        // Renders radial bar chart
                        RadialBarSeries<ChartData, String>(
                        dataSource: <ChartData>[
                          ChartData("Transport", 40, Color(0x5680E9)),
                          ChartData("Food", 50, Color(0x84CEEB)),
                          ChartData("Leisure", 60, Color(0x5AB9EA)),
                          ChartData("Others", 35, Color(0x8860D0)),
                        ],
                          pointColorMapper:(ChartData data,  _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          cornerStyle: CornerStyle.endCurve,
                          trackColor: Color(0xdddddd),
                          // dataLabelSettings: DataLabelSettings(isVisible: true),
                          radius: '80%',
                    ),
                  ],
                ),
              ),
              ],
                ),
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Recent Transactions'),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            child: Text('See all'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FinanceScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(screenId: SummaryScreen.id),
    );
  }
}
