//Adapter Pattern and Observer

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

// Target interface
abstract class CalculatorTarget {
  void setValue(String value);
  void compute();
  void dispose();
}

// Adaptee class
class CalculatorProvider extends ChangeNotifier implements CalculatorTarget {
  final compController = TextEditingController();

  @override
  void setValue(String value) {
    String str = compController.text;

    switch (value) {
      case "C":
        compController.clear();
        break;
      case "AC":
        compController.text = str.substring(0, str.length - 1);
        break;
      case "X":
        compController.text += "*";
        break;
      case "=":
        compute();
        break;
      default:
        compController.text += value;
    }
    compController.selection = TextSelection.fromPosition(
        TextPosition(offset: compController.text.length));
    notifyListeners();
  }

  @override
  void compute() {
    String text = compController.text;
    compController.text = text.interpret().toString();
    notifyListeners();
  }

  @override
  void dispose() {
    compController.dispose();
    notifyListeners();
  }
}

// Adapter class
class CalculatorAdapter implements CalculatorTarget {
  final CalculatorProvider _calculatorProvider;

  CalculatorAdapter(this._calculatorProvider);

  @override
  void setValue(String value) {
    // Modify the value if needed before delegating to the CalculatorProvider
    _calculatorProvider.setValue(value);
  }

  compute() {

    _calculatorProvider.compute();
  }

  @override
  void dispose() {
    _calculatorProvider.dispose();
  }
}

