import 'package:contant_magalie_b3/pages/Wizard_detail_page.dart';
import 'package:contant_magalie_b3/pages/Wizard_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizard App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WizardListPage(),
        '/detail': (context) {
          final wizardId = ModalRoute.of(context)?.settings.arguments as String;
          return WizardDetailPage(wizardId: wizardId);
        },
      },
    );
  }
}


