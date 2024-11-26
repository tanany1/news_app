import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}

