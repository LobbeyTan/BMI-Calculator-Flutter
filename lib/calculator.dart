import 'dart:math';

class Calculator {
  late double _height;
  late int _weight;
  late double bodyMassIndex;

  Calculator(int weight, double height) {
    _weight = weight;
    _height = height;
    bodyMassIndex = _weight / pow(_height / 100, 2);
  }

  String getBMI() => bodyMassIndex.toStringAsFixed(1);

  String getResult() {
    if (bodyMassIndex >= 30.0) return 'VERY OVERWEIGHT';
    if (bodyMassIndex >= 25.0) return 'OVERWEIGHT';
    if (bodyMassIndex >= 18.5) return 'NORMAL';
    return 'UNDERWEIGHT';
  }

  String getAdvice() {
    if (bodyMassIndex >= 30.0)
      return 'You are too obese. Please do more exercises and take care your diet.';
    if (bodyMassIndex >= 25.0)
      return 'You have a higher than normal body weight. Try to exercise more.';
    if (bodyMassIndex >= 18.5)
      return 'You have a normal body weight. Good job!';

    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
