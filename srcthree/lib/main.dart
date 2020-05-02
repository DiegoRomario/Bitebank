import 'package:flutter/material.dart';

import 'http/webclient.dart';
import 'models/contact.dart';
import 'models/transaction.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
  save(Transaction(666, Contact(0, 'Tico', 2000)))
      .then((transaction) => print(transaction));
  // findAll().then((transactions) => print('new transactions $transactions'));
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
