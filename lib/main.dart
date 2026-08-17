import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ExcelerateApp());
}

class ExcelerateApp extends StatelessWidget {
  const ExcelerateApp({super.key});

  @override
  Widget build(BuildContext context) {
    const sunsetOrange = Color(0xFFFF7A00);
    const hotPink = Color(0xFFFF1493);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excelerate',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: sunsetOrange,
        ),

        scaffoldBackgroundColor: const Color(0xFFFFF8F5),

        appBarTheme: const AppBarTheme(
          backgroundColor: sunsetOrange,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: hotPink,
            foregroundColor: Colors.white,
            elevation: 2,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      home: const LoginScreen(),
    );
  }
}