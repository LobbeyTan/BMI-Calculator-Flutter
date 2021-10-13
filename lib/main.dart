import 'package:demo/result.dart';
import 'package:flutter/material.dart';

import 'input.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF101438),
      ),
      home: BMICalculatorScreen(),
    );
  }
}
