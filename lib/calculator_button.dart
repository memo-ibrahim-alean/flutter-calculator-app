import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Widget? btnWidget;
  final int btnFlexValue;
  final double btnTextFontSize;
  final String? btnTextValue;
  final Color? btnColor;
  final Color? btnTextColor;

  const CalculatorButton({
    super.key,
    this.btnColor,
    this.btnWidget,
    this.btnTextColor,
    this.btnFlexValue = 1,
     this.btnTextValue,
    this.btnTextFontSize = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: btnFlexValue,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {},
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
