import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF17181A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$currentNumber',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CalculatorButton(
                                  btnTextValue: 'AC',
                                  btnTextFontSize: 24,
                                  btnColor: Color(0xFF616161),
                                  btnTextColor: Color(0xFFA5A5A5),
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnWidget: Icon(Icons.backspace,
                                      color: Color(0XFFA5A5A5)),
                                  btnColor: Color(0XFF616161),
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '/',
                                  btnColor: Color(0xFF005DB2),
                                  btnTextColor: Color(0xFF339DFF),
                                  onButtonTap: onOperatorClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CalculatorButton(
                                  btnTextValue: '7',
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '8',
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '9',
                                  onButtonTap: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CalculatorButton(
                                  btnTextValue: '4',
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '5',
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '6',
                                  onButtonTap: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CalculatorButton(
                                  btnTextValue: '1',
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '2',
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '3',
                                  onButtonTap: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CalculatorButton(
                                  btnTextValue: '0',
                                  btnFlexValue: 2,
                                  onButtonTap: onDigitClick,
                                ),
                                CalculatorButton(
                                  btnTextValue: '.',
                                  onButtonTap: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorButton(
                            btnTextValue: '*',
                            btnFlexValue: 2,
                            btnColor: Color(0xFF005DB2),
                            btnTextColor: Color(0xFF339DFF),
                            onButtonTap: onOperatorClick,
                          ),
                          CalculatorButton(
                            btnTextValue: '-',
                            btnFlexValue: 2,
                            btnColor: Color(0xFF005DB2),
                            btnTextColor: Color(0xFF339DFF),
                            onButtonTap: onOperatorClick,
                          ),
                          CalculatorButton(
                            btnTextValue: '+',
                            btnFlexValue: 3,
                            btnColor: Color(0xFF005DB2),
                            btnTextColor: Color(0xFF339DFF),
                            onButtonTap: onOperatorClick,
                          ),
                          CalculatorButton(
                            btnTextValue: '=',
                            btnFlexValue: 3,
                            btnColor: Color(0xFF1991FF),
                            btnTextColor: Color(0xFFB2DAFF),
                            onButtonTap: onEqualClick,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // int number = 12;
  String currentNumber = "";
  String savedNumber = "";
  String savedOperator = "";

  onDigitClick(String digit) {
    setState(() {
      currentNumber += digit;
    });
  }

  onOperatorClick(String operator) {
    if (savedOperator.isEmpty) {
      savedOperator = operator;
      savedNumber = currentNumber;
      currentNumber = "";
      setState(() {});
      return;
    }
    savedNumber = cal(savedNumber, currentNumber, savedOperator);
    savedOperator = operator;
    currentNumber = "";
    setState(() {});
  }

  onEqualClick(String _) {
    currentNumber = cal(savedNumber, currentNumber, savedOperator);
    savedNumber = "";
    savedOperator = "";
    setState(() {});
  }

  String cal(String savedNumber, String currentNumber, String savedOperator) {
    double result = 0;
    if (savedOperator == "+") {
      result = double.parse(savedNumber) + double.parse(currentNumber);
    } else if (savedOperator == "-") {
      result = double.parse(savedNumber) - double.parse(currentNumber);
    } else if (savedOperator == "*") {
      result = double.parse(savedNumber) * double.parse(currentNumber);
    } else if (savedOperator == "/") {
      result = double.parse(savedNumber) / double.parse(currentNumber);
    }
    return result.toString();
  }
}
