import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Widget? btnWidget;
  final int btnFlexValue;
  final double btnTextFontSize;
  final String? btnTextValue;
  final Color? btnColor;
  final Color? btnTextColor;
  final Function(String) onButtonTap;

  const CalculatorButton({
    super.key,
    this.btnColor,
    this.btnWidget,
    this.btnTextColor,
    this.btnFlexValue = 1,
    this.btnTextValue,
    this.btnTextFontSize = 32.0,
    required this.onButtonTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: btnFlexValue,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            if (btnTextValue != null) {
              onButtonTap(btnTextValue!);
            } else if (btnWidget != null) {
              onButtonTap('backspace'); // Handle backspace button
            }
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: btnColor ?? const Color(0XFF303136),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          child: btnWidget ?? Text(
            btnTextValue ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: btnTextFontSize,
                color: btnTextColor ?? const Color(0xFF29A8FF)),
          ),
        ),
      ),
    );
  }
}
