import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                    '23,400',
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
                                ),
                                CalculatorButton(
                                  btnWidget: Icon(Icons.backspace,
                                      color: Color(0XFFA5A5A5)),
                                  btnColor: Color(0XFF616161),
                                ),
                                CalculatorButton(
                                  btnTextValue: '/',
                                  btnColor: Color(0xFF005DB2),
                                  btnTextColor: Color(0xFF339DFF),
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
                                ),
                                CalculatorButton(
                                  btnTextValue: '8',
                                ),
                                CalculatorButton(
                                  btnTextValue: '9',
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
                                ),
                                CalculatorButton(
                                  btnTextValue: '5',
                                ),
                                CalculatorButton(
                                  btnTextValue: '6',
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
                                ),
                                CalculatorButton(
                                  btnTextValue: '2',
                                ),
                                CalculatorButton(
                                  btnTextValue: '3',
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
                                ),
                                CalculatorButton(
                                  btnTextValue: '.',
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
                          ),
                          CalculatorButton(
                            btnTextValue: '-',
                            btnFlexValue: 2,
                            btnColor: Color(0xFF005DB2),
                            btnTextColor: Color(0xFF339DFF),
                          ),
                          CalculatorButton(
                            btnTextValue: '+',
                            btnFlexValue: 3,
                            btnColor: Color(0xFF005DB2),
                            btnTextColor: Color(0xFF339DFF),
                          ),
                          CalculatorButton(
                            btnTextValue: '=',
                            btnFlexValue: 3,
                            btnColor: Color(0xFF1991FF),
                            btnTextColor: Color(0xFFB2DAFF),
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
}
