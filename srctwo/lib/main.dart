import 'package:bytebank/database/app-database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
  save(Contact(0, 'Demo', 11974355839)).then((id) {
    print("Id gerado: $id ");
    findAll().then((onValue) => debugPrint(onValue.toString()));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[600],
        accentColor: Colors.red[300],
        scaffoldBackgroundColor: Colors.blue[50],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo[800],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
