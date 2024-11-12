import 'package:flutter/material.dart';
import '../../theme.dart';
import 'components/drawer_header.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: IconTheme(
        data: iconTheme(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 드로어 헤더
            const DrawerHeader(
              decoration: drawerHeaderDecoration, // theme.dart에서 설정한 스타일 사용
              child: ProfileInfo(), // components.dart에서 불러온 ProfileInfo 위젯 사용
            ),
            // 드로어 메뉴 항목
            ListTile(
              leading: Icon(Icons.home),
              title: Text('관심종목'), // 텍스트 색상도 흰색으로 설정
              onTap: () {
                Navigator.pop(context); // 드로어 닫기
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('주식현재가'),
              onTap: () {
                Navigator.pop(context); // 드로어 닫기
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('주식차트'),
              onTap: () {
                Navigator.pop(context); // 드로어 닫기
              },
            ),
            Divider(color: Colors.white), // 구분선 색상도 흰색으로 설정
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('주식주문',),
              onTap: () {
                Navigator.pop(context); // 드로어 닫기
              },
            ),
          ],
        ),
      ),
    );
  }
}
