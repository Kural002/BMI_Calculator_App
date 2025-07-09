import 'package:bmi_calculator/widgets/bmi_circle_gauge.dart';
import 'package:bmi_calculator/widgets/gradient_button.dart';
import 'package:bmi_calculator/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/bmi_view_model.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BMIViewModel>();
    final bmi = viewModel.calculateBMI();
    final result = viewModel.getResult();
    final interpretation = viewModel.getInterpretation();

    Color getStatusColor() {
      if (bmi >= 25) return Colors.orange;
      if (bmi > 18.5) return Colors.green;
      return Colors.blue;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Your Results'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                BMICircleGauge(bmi: bmi, showStatus: true),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: getStatusColor(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SectionTitle(title: 'Healthy Range'),
                      const SizedBox(height: 10),
                      const LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 10,
                        backgroundColor: Color(0xFFE0E0E0),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('18.5', style: TextStyle(color: Colors.grey)),
                          Text('Normal', style: TextStyle(color: Colors.green)),
                          Text('25', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GradientButton(
                  text: 'Recalculate',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}