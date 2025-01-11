import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/login_page.dart';
import 'screens/confirmation_page.dart';
import 'screens/home_page.dart';

import 'screens/classification_page.dart';


void main() {
  runApp(EcoSortApp());
}

class EcoSortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoSort',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto', // Custom font to match the UI
      ),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/confirmation': (context) => ConfirmationPage(),
        '/home': (context) => HomePage(),
        '/classification': (context) => const ClassificationPage(),
        '/history': (context) => HistoryPage(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
