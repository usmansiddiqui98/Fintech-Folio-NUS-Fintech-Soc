import 'package:fintech_folio/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/deal_screen.dart';
import 'screens/education_screen.dart';
import 'screens/finance_screen.dart';
import 'screens/goal_screen.dart';
import 'screens/news_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/summary_screen.dart';
import 'screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) =>
            LoginScreen(title: 'Flutter Demo Home Page'),
        DealScreen.id: (context) => DealScreen(),
        EducationScreen.id: (context) => EducationScreen(),
        FinanceScreen.id: (context) => FinanceScreen(),
        GoalScreen.id: (context) => GoalScreen(),
        NewsScreen.id: (context) => NewsScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        SummaryScreen.id: (context) => SummaryScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
      title: 'FintechFolio',
      theme: ThemeData(fontFamily: 'Nunito'),
    );
  }
}
