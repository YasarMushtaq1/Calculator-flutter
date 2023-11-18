//Strategy Pattern
import 'package:ace_calc/constant/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/button.dart';

// Define the strategy interface
abstract class ButtonStrategy {
  void onPressed(String label);
}

// Concrete Strategy A
class DefaultButtonStrategy implements ButtonStrategy {
  @override
  void onPressed(String label) {
    print("Default strategy: $label");
    // Add your default button behavior here
  }
}

// Concrete Strategy B
class SpecialButtonStrategy implements ButtonStrategy {
  @override
  void onPressed(String label) {
    print("Special strategy: $label");
    // Add your special button behavior here
  }
}

List<Widget> buttonList = [
  const Button1(
    label: "C",
    textColor: AppColors.secondaryColor,
  ),
  const Button1(
    label: "/",
    textColor: AppColors.secondaryColor,
  ),
  const Button1(
    label: "X",
    textColor: AppColors.secondaryColor,
  ),
  const Button1(
    label: "AC",
    textColor: AppColors.secondaryColor,
  ),
  const Button1(
    label: "7",
  ),
  const Button1(
    label: "8",
  ),
  const Button1(
    label: "9",
  ),
  const Button1(
    label: "+",
    textColor: AppColors.secondaryColor,
  ),
  const Button1(
    label: "4",
  ),
  const Button1(
    label: "5",
  ),
  const Button1(
    label: "6",
  ),
  const Button1(
    label: "-",
    textColor: AppColors.secondaryColor,
  ),
  const Button1(
    label: "1",
  ),
  const Button1(
    label: "2",
  ),
  const Button1(
    label: "3",
  ),
  const Button1(
    label: "%",
  ),
  const Button1(
    label: "0",
  ),
  const Button1(
    label: ".",
  ),
];

// Context class that uses the strategy
class ButtonContext {
  ButtonStrategy _strategy = DefaultButtonStrategy();

  void setStrategy(ButtonStrategy strategy) {
    _strategy = strategy;
  }

  void handleButtonPress(String label) {
    _strategy.onPressed(label);
  }
}

// Example usage
void main() {
  // Create a context object
  ButtonContext buttonContext = ButtonContext();

  // Set the default strategy
  buttonContext.setStrategy(DefaultButtonStrategy());

  // Simulate button presses
  buttonList.forEach((button) {
    if (button is Button1) {
      button.onPressed = () {
        buttonContext.handleButtonPress(button.label);
      };
    }
  });

  // Change the strategy dynamically
  buttonContext.setStrategy(SpecialButtonStrategy());

  // Simulate button presses with the new strategy
  buttonList.forEach((button) {
    if (button is Button1) {
      button.onPressed = () {
        buttonContext.handleButtonPress(button.label);
      };
    }
  });
}
