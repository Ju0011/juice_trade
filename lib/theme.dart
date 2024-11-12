import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';


TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
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
    primarySwatch: Colors.green,
    cardTheme: cardTheme(),
    elevatedButtonTheme: elevatedButtonTheme(), // ElevatedButton 테마 적용

  );
}

DrawerThemeData drawerTheme(){
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
      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue), // 버튼 배경색
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // 텍스트 색상
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 24), // 패딩 설정
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




