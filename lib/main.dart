import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() => runApp(FirstClassApp());

class FirstClassApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}
