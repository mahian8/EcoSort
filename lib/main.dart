import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/login_page.dart';
import 'screens/confirmation_page.dart';
import 'screens/home_page.dart';
import 'screens/resources_page.dart' as resources;
import 'screens/classification_page.dart';
import 'screens/settings_page.dart' as settings;

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
        '/resources': (context) => resources.ResourcesPage(),
        '/classification': (context) => const ClassificationPage(),
        '/history': (context) => HistoryPage(),
        '/settings': (context) => settings.SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
