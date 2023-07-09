import 'package:flutter/material.dart';
import 'package:news_akr23/view/home.dart';
import 'package:news_akr23/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplash = true;
  LoadHome() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showingSplash = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newsify',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFCE93D8, {
          50: Color(0xFFF3E5F5),
          100: Color(0xFFE1BEE7),
          200: Color(0xFFCE93D8),
          300: Color(0xFFBA68C8),
          400: Color(0xFFAB47BC),
          500: Color(0xFF9C27B0),
          600: Color(0xFF8E24AA),
          700: Color(0xFF7B1FA2),
          800: Color(0xFF6A1B9A),
          900: Color(0xFF4A148C),
        }),
      ),
      home: showingSplash ? SplashScreen() : HomeScreen(),
    );
  }
}
