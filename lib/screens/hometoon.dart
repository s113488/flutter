import 'package:flutter/material.dart';

class HomeToon extends StatelessWidget {
  const HomeToon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
