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
      backgroundColor: const Color(0xffD3D3D3),
      appBar: AppBar(
        title: const Text("홈"),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin: const EdgeInsets.all(20.0), // 화면 여백
              decoration: homeContainer,

              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("상위 거래량", style: middleTitle()),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: TradingVolumeListTest(),
                  ),
                  const SizedBox(height: 14.0),
                ],
              ),
            ),
            const SizedBox(height: 8.0),


            Container(
              margin: const EdgeInsets.all(20.0),
              decoration: homeContainer,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("시가총액 상위", style: middleTitle()),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: TradingVolumeListTest2(),
                  ),
                  const SizedBox(height: 14.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

