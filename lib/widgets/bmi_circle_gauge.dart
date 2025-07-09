import 'package:flutter/material.dart';

class BMICircleGauge extends StatelessWidget {
  final double bmi;
  final bool showStatus;

  const BMICircleGauge({
    super.key,
    required this.bmi,
    this.showStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    Color getGaugeColor() {
      if (bmi >= 25) return Colors.orange;
      if (bmi > 18.5) return Colors.green;
      return Colors.blue;
    }

    String getStatus() {
      if (bmi >= 25) return 'Overweight';
      if (bmi > 18.5) return 'Normal';
      return 'Underweight';
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: bmi / 40,
            strokeWidth: 12,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(getGaugeColor()),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Text(
              'BMI',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            if (showStatus) ...[
              const SizedBox(height: 8),
              Text(
                getStatus(),
                style: TextStyle(
                  fontSize: 18,
                  color: getGaugeColor(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}