import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
    titleMedium: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
  );
}


AppBarTheme appBarTheme() {
  return const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white, // AppBar 아이콘(뒤로가기 버튼) 색상 설정
    ),
    centerTitle: true,
    color: Color(0xff000080),
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  );
}


BottomNavigationBarThemeData bottomNavigatorTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xff000080),
    unselectedItemColor: Colors.black54,
    showUnselectedLabels: true,
  );
}



ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    drawerTheme: drawerTheme(),
    bottomNavigationBarTheme: bottomNavigatorTheme(),
    primarySwatch: Colors.indigo,
    cardTheme: cardTheme(),
    elevatedButtonTheme: elevatedButtonTheme(), // ElevatedButton 테마 적용

  );
}

DrawerThemeData drawerTheme() {
  return const DrawerThemeData(
    backgroundColor: Colors.white,
  );
}


IconThemeData iconTheme(){
  return const IconThemeData(
    color: Colors.white,
  );
}

const BoxDecoration drawerHeaderDecoration = BoxDecoration(
  color: Color(0xff000080),
);

CardTheme cardTheme(){
  return CardTheme(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))
  );
}

// 더보기 버튼
ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xffD3D3D3)), // 버튼 배경색
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black), // 텍스트 색상
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 90), // 패딩 설정 - 세로 가로
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // 텍스트 스타일 설정
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // 버튼 모서리
        ),
      ),
    ),
  );
}

// 주식 아이콘 CircleAvatar
Widget stockAvatar(String? name, {Color backgroundColor = Colors.blue}) {
  return CircleAvatar(
    backgroundColor: backgroundColor,
    child: Text(
      name?.substring(0, 1) ?? '',
      style: const TextStyle(color: Colors.white),
    ),
  );
}


// 기준가에 따른 텍스트 색 지정
TextStyle percentageTextStyle(double befDiff, int temp, double size) {
  return TextStyle(
    fontSize: size,
    color: befDiff >= temp ? Colors.red : Colors.blue,
    fontWeight: FontWeight.bold,
  );
}

TextStyle middleTitle() {
  return const TextStyle(
    fontSize: 23.0,
    fontWeight: FontWeight.bold,
  );
}

BoxDecoration homeContainer = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20), // 둥근 테두리 반경
);

// 현재가 박스
BoxDecoration nowCostContainer = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
);
