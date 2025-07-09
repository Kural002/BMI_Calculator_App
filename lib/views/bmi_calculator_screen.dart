import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/widgets/bmi_circle_gauge.dart';
import 'package:bmi_calculator/widgets/gradient_button.dart';
import 'package:bmi_calculator/widgets/input_slider_card.dart';
import 'package:bmi_calculator/widgets/metric_selector_card.dart';
import 'package:bmi_calculator/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/bmi_view_model.dart';

import 'result_screen.dart';

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BMIViewModel>();
    final bmi = viewModel.calculateBMI();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Vitality BMI'),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                BMICircleGauge(bmi: bmi),
                const SizedBox(height: 30),
                const SectionTitle(title: 'Your Details'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: MetricSelectorCard(
                        icon: Icons.male,
                        label: 'Male',
                        isSelected: viewModel.bmiModel.gender == Gender.male,
                        onTap: () => viewModel.setGender(Gender.male),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: MetricSelectorCard(
                        icon: Icons.female,
                        label: 'Female',
                        isSelected: viewModel.bmiModel.gender == Gender.female,
                        onTap: () => viewModel.setGender(Gender.female),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InputSliderCard(
                  title: 'Height',
                  value: viewModel.bmiModel.height,
                  unit: 'cm',
                  min: 120,
                  max: 220,
                  onChanged: (value) => viewModel.setHeight(value),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InputSliderCard(
                        title: 'Weight',
                        value: viewModel.bmiModel.weight,
                        unit: 'kg',
                        min: 30,
                        max: 150,
                        onChanged: (value) => viewModel.setWeight(value),
                        showButtons: true,
                        onIncrement: () => viewModel.incrementWeight(),
                        onDecrement: () => viewModel.decrementWeight(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InputSliderCard(
                        title: 'Age',
                        value: viewModel.bmiModel.age.toDouble(),
                        unit: 'yrs',
                        min: 10,
                        max: 100,
                        onChanged: (value) => viewModel.setAge(value.toInt()),
                        showButtons: true,
                        onIncrement: () => viewModel.incrementAge(),
                        onDecrement: () => viewModel.decrementAge(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GradientButton(
                  text: 'Calculate BMI',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResultScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}