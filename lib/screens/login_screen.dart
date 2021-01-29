import 'package:fintech_folio/screens/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:fintech_folio/components/rounded_button.dart';
import 'summary_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  LoginScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(0xFFFFFFFF),
              Color(0xFF9CD5F2),
              Color(0xFF5A82EA),
              Color(0xFF8860D0)
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Text(
                "FintechFolio",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 10.0,
                        color: Color(0xFF000000),
                      ),
                    ]),
              ),
              SizedBox(
                height: 60,
              ),
              RoundedButton(
                  title: 'NUS Login',
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, SummaryScreen.id);
                  }),
              RoundedButton(
                  title: 'Biometric Login',
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, SummaryScreen.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
