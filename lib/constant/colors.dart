// Factory pattern
import 'package:flutter/material.dart';

// Target interface
abstract class ColorAdapter {
  Color getPrimaryColor();
  Color getSecondaryColor();
  Color getSecondary2Color();
}

// Adapter class
class AppColorsAdapter implements ColorAdapter {
  @override
  Color getPrimaryColor() {
    return AppColors.primaryColor;
  }

  @override
  Color getSecondaryColor() {
    return AppColors.secondaryColor;
  }

  @override
  Color getSecondary2Color() {
    return AppColors.secondary2Color;
  }
}

class AppColors {
  static const primaryColor = Color(0xFF808080);
  static const secondaryColor = Color(0xFF654321);
  static const secondary2Color = Color(0xFF808080);

  // Create an adapter instance
  static final ColorAdapter adapter = AppColorsAdapter();
}

// Usage example
void main() {
  Color primaryColor = AppColors.adapter.getPrimaryColor();
  Color secondaryColor = AppColors.adapter.getSecondaryColor();
  Color secondary2Color = AppColors.adapter.getSecondary2Color();

}
