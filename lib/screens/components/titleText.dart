import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color textColor;
  const TitleText({super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: textColor,
        fontSize: 20.0,
      ),
    );
  }
}
