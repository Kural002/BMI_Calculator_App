class BMIModel {
  final double height;
  final double weight;
  final int age;
  final Gender? gender;

  BMIModel({
    this.height = 180,
    this.weight = 60,
    this.age = 25,
    this.gender,
  });

  BMIModel copyWith({
    double? height,
    double? weight,
    int? age,
    Gender? gender,
  }) {
    return BMIModel(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}

enum Gender { male, female }