import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculationProvider extends ChangeNotifier {
  String _equation = "0";
  String _result = "0";
  String _expression = "";

  String get equation => _equation;

  String get result => _result;

  String get expression => _expression;

   buttonPressed(String buttonText) {
     print("-----$buttonText");
     String doesContainDecimal(dynamic result) {
      if (result.toString().contains(".")) {
        List<String> splitDecimal = result.toString().split(".");
        if ((int.parse(splitDecimal[1]) > 0)) {
          _result = splitDecimal[0].toString();
        }
      }
      _result = result;
      notifyListeners();
      return result;
    }

    if (buttonText == "AC") {
      print("--ff---$buttonText");


      _equation = "0";
      _result = "0";
      notifyListeners();
    } else if (buttonText == "⌫") {
      _equation = _equation.substring(0, _equation.length - 1);
      if (_equation == "") {
        _equation = "0";
      }
    } else if (buttonText == "+/-") {
      if (_equation[0] != "-") {
        _equation = "-$_equation";
      } else {
        _equation = _equation.substring(1);
      }
    } else if (buttonText == "=") {
      _expression = _equation;
      _expression = _expression.replaceAll("x", "*");
      _expression = _expression.replaceAll("÷", "/");
      _expression = _expression.replaceAll("%", "%");
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        _result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        if (_expression.contains("%")) {
          _result = doesContainDecimal(result);
        }
        notifyListeners();
      } catch (e) {
        _result = "error";
      }
    } else {
      if (_equation == "0") {
        _equation = buttonText;
      } else {
        _equation = _equation + buttonText;
      }
    }
    notifyListeners();
  }
}
