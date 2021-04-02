import 'package:fintech_folio/constants.dart';
import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';
import 'package:fintech_folio/functions/user_database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fintech_folio/custom/chart_data.dart';
import 'package:fintech_folio/custom/transaction.dart';
import 'finance_screen.dart';
import 'package:intl/intl.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  List<ChartData> _chartDataList = new List();

  getChartDataList() async {
    UserDatabase userdb = new UserDatabase("3");
    Map expenseData = await userdb.getExpenditure();
    Map expense = new Map();
    for (String category in expenseData.keys) {
      int money = 0;
      for (String title in expenseData[category].keys) {
        money += expenseData[category][title]['money'];
      }
      expense[money] = category;
    }

    //print(expense.values);
    //Get top 3 expenditure
    var keys = expense.keys.toList();
    keys.sort();
    var sortedKeys = keys.reversed;
    //sortedKeys in descending order
    List<int> finalKeys = new List();
    //print(sortedKeys);

    //This code assume that you have at least 3 categories in your expenses
    if (sortedKeys.length < 3) {
      throw new Exception("Fewer than 3 expense categories from database");
    }
    int count = 0;
    for (int i = 0; i < sortedKeys.length; i++) {
      if (i >= 3) {
        count += sortedKeys.elementAt(i);
      } else {
        finalKeys.add(sortedKeys.elementAt(i));
      }
    }
    finalKeys.add(count);
    List<ChartData> chartDataList = new List();
    //Top 3 ChartData
    for (int i = 0; i < 3; i++) {
      int money = finalKeys[i];
      chartDataList.add(
          new ChartData(expense[money], money.toDouble(), kChartDataColors[i]));
    }
    chartDataList.add(
        new ChartData("Others", finalKeys[3].toDouble(), kChartDataColors[3]));

    setState(() {
      _chartDataList = chartDataList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChartDataList();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Text('305'),
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
                            dataSource: _chartDataList,
                            // dataSource: <ChartData>[
                            //   ChartData("Transport", 40, Color(0x5680E9)),
                            //   ChartData("Food", 50, Color(0x84CEEB)),
                            //   ChartData("Leisure", 60, Color(0x5AB9EA)),
                            //   ChartData("Others", 35, Color(0x8860D0)),
                            // ],
                            pointColorMapper: (ChartData data, _) => data.color,
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
                                            builder: (context) =>
                                                FinanceScreen()));
                                  },
                                ),
                              ),
                            ],
                          ),
                          transaction(
                              "nike",
                              DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
                              Colors.deepPurple,
                              10.00),
                          transaction(
                              "nike",
                              DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
                              Colors.blue,
                              10.00),
                        ],
                      ),
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
