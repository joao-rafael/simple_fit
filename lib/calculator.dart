import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25 && _bmi <= 29) {
      return 'Sobrepeso';
    } else if (_bmi > 29) {
      return 'Obesidade';
    } else if (_bmi > 25 && _bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do Peso';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25 && _bmi <= 29) {
      return 'Você está um pouco acima do peso, tente se exercitar mais ou uma dieta mais balanceada.';
    } else if (_bmi > 29) {
      return 'Você está obeso, convém mudar hábitos e procurar auxílio médico ou profissional.';
    } else if (_bmi > 25 && _bmi > 18.5) {
      return 'Seu peso está normal, parabéns!';
    } else {
      return 'Você está com o peso abaixo do normal. Convém mudar hábitos, comer mais e procurar auxílio médico ou profissional.';
    }
  }
}
