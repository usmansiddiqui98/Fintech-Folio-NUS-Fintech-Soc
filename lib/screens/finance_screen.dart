import 'package:fintech_folio/components/rounded_button.dart';
import 'package:fintech_folio/functions/user_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';
import 'package:fintech_folio/custom/transaction.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class FinanceScreen extends StatefulWidget {
  static const String id = 'finance_screen';

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List<Widget> _transactionDataList = new List();

  getRecentTransactionsData() async {
    UserDatabase userdb = new UserDatabase("3");
    Map transactionData = await userdb.getTransactions();
    List<Widget> transactions = new List();
    // int limit = 3;
    int count = 0;
    for (String datetime in transactionData.keys) {
      // if (count >= limit) { break; }
      count++;
      Map record = transactionData[datetime];
      print(record);
      transactions.add(new Transaction(
          record.entries.elementAt(1).value,
          record.entries.elementAt(0).value,
          kRecentTransactionColors[count%3],
          record.entries.elementAt(3).value.toDouble()));
    }

    setState(() {
      _transactionDataList = transactions;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecentTransactionsData();
  }

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
          ..._transactionDataList
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

  Widget _displayWidget;

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
                            _displayWidget ?? today(),
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
                              child: Text('1120'),
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
                              child: Text('5500'),
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
