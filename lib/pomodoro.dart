import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        cardColor: const Color(0xFFF4EDDB),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(
              (0xFF232B55),
            ),
          ),
        ),
      ),
    );
  }
}
