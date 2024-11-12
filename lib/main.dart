import 'package:flutter/material.dart';
import 'package:juice_trade/screens/main_screen.dart';
import 'package:juice_trade/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'juice_trade',
      home: MainScreens(),
      debugShowCheckedModeBanner: false,

      theme: theme(),
    );
  }
}