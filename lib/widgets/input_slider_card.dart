import 'package:flutter/material.dart';

class InputSliderCard extends StatelessWidget {
  final String title;
  final String unit;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final bool showButtons;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const InputSliderCard({
    super.key,
    required this.title,
    required this.unit,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.showButtons = false,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (showButtons)
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onDecrement,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              if (showButtons) const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${value.toStringAsFixed(showButtons ? 0 : 1)} $unit',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: value,
                      min: min,
                      max: max,
                      onChanged: onChanged,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey[300],
                    ),
                  ],
                ),
              ),
              if (showButtons) const SizedBox(width: 8),
              if (showButtons)
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onIncrement,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}