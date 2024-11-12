import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../drawer/drawer_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("홈"),
      ),
      drawer: DrawerScreen(),

    );
  }
}
