import 'package:flutter/material.dart';
import '../models/bmi_model.dart';

class BMIViewModel extends ChangeNotifier {
  BMIModel _bmiModel = BMIModel();

  BMIModel get bmiModel => _bmiModel;

  void setGender(Gender gender) {
    _bmiModel = _bmiModel.copyWith(gender: gender);
    notifyListeners();
  }

  void setHeight(double height) {
    _bmiModel = _bmiModel.copyWith(height: height);
    notifyListeners();
  }

  void setWeight(double weight) {
    _bmiModel = _bmiModel.copyWith(weight: weight);
    notifyListeners();
  }

  void setAge(int age) {
    _bmiModel = _bmiModel.copyWith(age: age);
    notifyListeners();
  }

  void incrementWeight() {
    _bmiModel = _bmiModel.copyWith(weight: _bmiModel.weight + 1);
    notifyListeners();
  }

  void decrementWeight() {
    _bmiModel = _bmiModel.copyWith(weight: _bmiModel.weight - 1);
    notifyListeners();
  }

  void incrementAge() {
    _bmiModel = _bmiModel.copyWith(age: _bmiModel.age + 1);
    notifyListeners();
  }

  void decrementAge() {
    _bmiModel = _bmiModel.copyWith(age: _bmiModel.age - 1);
    notifyListeners();
  }

  double calculateBMI() {
    return _bmiModel.weight / ((_bmiModel.height / 100) * (_bmiModel.height / 100));
  }

  String getResult() {
    final bmi = calculateBMI();
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    final bmi = calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}