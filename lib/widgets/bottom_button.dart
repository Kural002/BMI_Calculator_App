import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  final double height;
  final double fontSize;

  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
    this.height = 80.0,
    this.fontSize = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: height,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}