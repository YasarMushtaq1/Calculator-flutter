// Decorator and Singleton patterns

import 'package:ace_calc/constant/colors.dart';
import 'package:ace_calc/provider/cal_provider.dart';
import 'package:ace_calc/screens/widgets_data.dart';
import 'package:ace_calc/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cal_button.dart';

// Decorator interface
abstract class HomeScreenDecorator {
  Widget buildBody(BuildContext context, CalculatorProvider provider);
}

// Concrete decorator class
class LoggingDecorator implements HomeScreenDecorator {
  final HomeScreenDecorator _decorator;

  LoggingDecorator(this._decorator);

  @override
  Widget buildBody(BuildContext context, CalculatorProvider provider) {
    print('Building HomeScreen Body');
    return _decorator.buildBody(context, provider);
  }
}

// Singleton instance of the decorator
final HomeScreenDecorator _singletonDecorator = LoggingDecorator(_HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _singletonDecorator.buildBody(context, context.read<CalculatorProvider>());
  }
}

// Concrete component class
class _HomeScreen implements HomeScreenDecorator {
  @override
  Widget buildBody(BuildContext context, CalculatorProvider provider) {
    final screenHeight = MediaQuery.of(context).size.height;
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
    const grayColor = Color(0xFF808080);
    const decoration = BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Ace Calculator"),

        backgroundColor: Color(0xFF808080),

      ),
      body: Column(
        children: [
          CustomTextField(
            controller: provider.compController,
          ),
          const Spacer(),
          Container(
            height: screenHeight * 0.6,
            width: double.infinity,
            padding: padding,
            decoration: decoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) => buttonList[index]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) => buttonList[index + 4]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) => buttonList[index + 8]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                3, (index) => buttonList[index + 12]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                3, (index) => buttonList[index + 15]),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const CalculateButton()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

