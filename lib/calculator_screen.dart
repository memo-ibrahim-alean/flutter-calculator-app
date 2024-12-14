import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String currentNumber = "0"; // Start with "0"
  String savedNumber = "";
  String savedOperator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17181A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    currentNumber,
                    style: const TextStyle(
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
                                  btnColor: const Color(0xFF616161),
                                  btnTextColor: const Color(0xFFA5A5A5),
                                  onButtonTap: onAcClick,
                                ),
                                CalculatorButton(
                                  btnWidget: Icon(Icons.backspace,
                                      color: const Color(0xFFA5A5A5)),
                                  btnColor: const Color(0xFF616161),
                                  onButtonTap: removeDigit,
                                ),
                                CalculatorButton(
                                  btnTextValue: '/',
                                  btnColor: const Color(0xFF005DB2),
                                  btnTextColor: const Color(0xFF339DFF),
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
                            btnColor: const Color(0xFF005DB2),
                            btnTextColor: const Color(0xFF339DFF),
                            onButtonTap: onOperatorClick,
                          ),
                          CalculatorButton(
                            btnTextValue: '-',
                            btnFlexValue: 2,
                            btnColor: const Color(0xFF005DB2),
                            btnTextColor: const Color(0xFF339DFF),
                            onButtonTap: onOperatorClick,
                          ),
                          CalculatorButton(
                            btnTextValue: '+',
                            btnFlexValue: 2,
                            btnColor: const Color(0xFF005DB2),
                            btnTextColor: const Color(0xFF339DFF),
                            onButtonTap: onOperatorClick,
                          ),
                          CalculatorButton(
                            btnTextValue: '=',
                            btnFlexValue: 3,
                            btnColor: const Color(0xFF1991FF),
                            btnTextColor: const Color(0xFFB2DAFF),
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

  void onDigitClick(String digit) {
    setState(() {
      // Prevent multiple decimal points or leading decimal point
      if (digit == '.' && currentNumber.contains('.')) {
        return;
      }
      if (currentNumber == '0' && digit != '.') {
        currentNumber = digit;
      } else {
        currentNumber += digit;
      }
    });
  }

  void onOperatorClick(String operator) {
    if (currentNumber.isEmpty || currentNumber == "0") return;

    if (savedOperator.isNotEmpty) {
      savedNumber = cal(savedNumber, currentNumber, savedOperator);
      currentNumber = "0";
    } else {
      savedNumber = currentNumber;
      currentNumber = "";
    }

    savedOperator = operator;
    setState(() {});
  }

  void onEqualClick(String _) {
    if (currentNumber.isEmpty || currentNumber == "0") return;

    if (savedOperator == "/" && double.parse(currentNumber) == 0) {
      setState(() {
        currentNumber = "Error";
      });
      return;
    }

    currentNumber = cal(savedNumber, currentNumber, savedOperator);

    if (currentNumber.endsWith(".0")) {
      currentNumber = currentNumber.substring(0, currentNumber.length - 2);
    }

    savedNumber = "";
    savedOperator = "";
    setState(() {});
  }

  void removeDigit(String _) {
    setState(() {
      if (currentNumber.isNotEmpty) {
        currentNumber = currentNumber.substring(0, currentNumber.length - 1);
      }
      if (currentNumber.isEmpty) {
        currentNumber = "0";
      }

      if (currentNumber.endsWith('.')) {
        currentNumber = currentNumber.substring(0, currentNumber.length - 1);
      }
    });
  }

  void onAcClick(String _) {
    setState(() {
      savedOperator = "";
      savedNumber = "";
      currentNumber = "0";
    });
  }

  String cal(String savedNumber, String currentNumber, String savedOperator) {
    double result = 0;
    double num1 = double.parse(savedNumber);
    double num2 = double.parse(currentNumber);

    if (savedOperator == "+") {
      result = num1 + num2;
    } else if (savedOperator == "-") {
      result = num1 - num2;
    } else if (savedOperator == "*") {
      result = num1 * num2;
    } else if (savedOperator == "/") {
      if (num2 == 0) {
        return "Error"; // Division by zero
      }
      result = num1 / num2;
    }
    return result.toString();
  }
}
