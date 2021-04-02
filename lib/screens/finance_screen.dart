import 'package:fintech_folio/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';
import 'package:fintech_folio/custom/chart_data.dart';
import 'package:fintech_folio/custom/transaction.dart';

class FinanceScreen extends StatefulWidget {
  static const String id = 'finance_screen';

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {

  Widget today() {
    return Align(child: Card(
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
            ],
          ),
          transaction(
              "nike",
              new DateTime.utc(2021, DateTime.january, 1),
              Colors.deepPurple,
              10.0),
          transaction(
              "nike",
              new DateTime.utc(2021, DateTime.january, 1),
              Colors.deepPurple,
              10.0),
        ],
      ),
    ),);
  }

  Widget weekly() {
    return Align();
  }

  Widget monthly() {
    return Align();
  }

  Widget _displayWidget = Card(
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
          ],
        ),
        transaction(
            "nike",
            new DateTime.utc(2021, DateTime.january, 1),
            Colors.deepPurple,
            10.0),
        transaction(
            "nike",
            new DateTime.utc(2021, DateTime.january, 1),
            Colors.deepPurple,
            10.0),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(title: "Finances"),
        bottomNavigationBar:
            CustomBottomNavigationBar(screenId: FinanceScreen.id),
        body: SafeArea(
            child: Container(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                          children: <Widget>[
                            Expanded(
                              child: RoundedButton(
                                  title: 'Today',
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _displayWidget = today();
                                    });
                                  }
                              ),
                            ),
                            Expanded(
                              child: RoundedButton(
                                  title: 'Weekly',
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _displayWidget = weekly();
                                    });
                                  }
                              ),
                            ),
                            SizedBox(),
                            Expanded(
                              child: RoundedButton(
                                  title: 'Monthly',
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _displayWidget = monthly();
                                    });
                                  }
                              ),
                            ),
                          ]
                      ),
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Expenses'),
                            ),
                            // For changing widget
                            _displayWidget,
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Income'),
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
                              child: Text('Overall Balance'),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text('dummy value'),
                            ),
                          ],
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}
