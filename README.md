# Ace calculator

A simple Flutter project (Calculator) with the usage of six Software Design Patterns [ Adapter, Strategy, Observer, Singleton, Factory, Decorator] .

1. main.dart:
Design Patterns Used: Singleton Pattern
The CalculatorProvider is created as a singleton using ChangeNotifierProvider. This ensures that there's only one instance of CalculatorProvider shared throughout the app.
2. home_screen.dart:
Design Patterns Used: Decorator Pattern (Logging Decorator)
The LoggingDecorator class is a concrete decorator that adds logging functionality to the HomeScreenDecorator interface. This is a use of the Decorator pattern to extend the behavior of the original HomeScreen component.
Design Patterns Used: Singleton Pattern
The HomeScreen class uses a singleton instance of the LoggingDecorator as _singletonDecorator.
3. widgets_data.dart:
Design Patterns Used: Strategy Pattern
The ButtonStrategy interface defines the strategy for button behavior, and two concrete strategies (DefaultButtonStrategy and SpecialButtonStrategy) are implemented. The ButtonContext class acts as the context that uses these strategies.
4. button.dart:
Design Patterns Used: None Explicitly
This file seems to be defining a custom button widget (Button1). While there's no explicit use of a design pattern, the general structure conforms to Flutter widget patterns.
5. cal_button.dart:
Design Patterns Used: None Explicitly
Similar to the button.dart file, this file defines a custom button widget (CalculateButton) without explicit use of design patterns.
6. text_field.dart:
Design Patterns Used: None Explicitly
This file defines a custom text field widget (CustomTextField) without explicit use of design patterns.
7. cal_provider.dart:
Design Patterns Used: Adapter Pattern (CalculatorAdapter) and Observer Pattern
The CalculatorProvider class acts as an adaptee, implementing the CalculatorTarget interface. The CalculatorAdapter is the adapter class that adapts the CalculatorProvider to the CalculatorTarget interface.
The CalculatorProvider also extends ChangeNotifier, indicating the use of the Observer pattern for notifying listeners of state changes.
8. colors.dart:
Design Patterns Used: Factory Pattern
The ColorAdapter interface defines the factory methods for obtaining primary, secondary, and secondary2 colors. The AppColorsAdapter is the concrete adapter class implementing this interface. The AppColors class then serves as the client using the factory methods.
Overall:
The project exhibits a good mix of design patterns such as Singleton, Decorator, Strategy, Adapter, and Factory, each serving its purpose in different parts of the application. This modular approach enhances code maintainability and extensibility.


# Heed:
Its not advisable to use these Software Design Patterns for a simple flutter project like calculator. Its just a practical project.

# From 
Series [Ace] products.

