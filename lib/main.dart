import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/view_models/bmi_view_model.dart';
import 'package:bmi_calculator/views/bmi_calculator_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BMIViewModel(),
      child: const BMICalculatorApp(),
    ),
  );
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitality BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const BMICalculatorScreen(),
    );
  }
}