import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final double fontSize;

  const IconContent({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize = 80.0,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: iconSize),
        const SizedBox(height: 15),
        Text(label, style: TextStyle(fontSize: fontSize)),
      ],
    );
  }
}