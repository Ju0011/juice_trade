import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juice_trade/screens/sigachong_aeg/sigachong_aeg_screen.dart';
import 'package:juice_trade/screens/trading_volume_top/trading_volume_top_screen.dart';
import 'check_list/check_list_screen.dart';
import 'home/home_screen.dart';
import 'my_page/my_page_screen.dart';




class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomeScreen(), TradingVolumeScreen(), SigachongAegScreen(), CheckListScreen(), MyPageScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(label: '홈', icon: Icon(CupertinoIcons.home)),
          const BottomNavigationBarItem(label: '상위 거래량', icon: Icon(CupertinoIcons.arrow_up_circle)),
          BottomNavigationBarItem(label: '시가 총액 상위', icon: Icon(CupertinoIcons.bell_fill)),
          BottomNavigationBarItem(label: '관심종목', icon: Icon(CupertinoIcons.square_on_square)),
          BottomNavigationBarItem(label: '마이페이지', icon: Icon(CupertinoIcons.person)),
        ],
      ),
    );
  }
}
