import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:juice_trade/screens/home/test2.dart';
import '../../theme.dart';
import '../drawer/drawer_screen.dart';
import 'test.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("홈"),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("상위 거래량", style: middleTitle()),
              ),
            ),


            SizedBox(
              height: 400,
              child: TradingVolumeListTest(),
            ),
            const SizedBox(height: 16.0), // 여백 추가
            const Divider(thickness: 1, height: 1, color:Color(0xffC0C0C0)),


            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("시가총액 상위", style: middleTitle()),
              ),
            ),


            SizedBox(
              height: 400,
              child: TradingVolumeListTest2(),
            ),
          ],
        ),
      ),
    );
  }
}
