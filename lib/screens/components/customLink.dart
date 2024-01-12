import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  final Function() onPress;
  final text;
  final textColor;
  const CustomLink({super.key, required this.onPress, this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
