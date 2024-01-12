import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final textColor;
  final backgroundColor;
  final text;
  final Function() onPress;
  const CustomButton({super.key, this.textColor, this.backgroundColor, required this.onPress, this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialButton(
        onPressed: onPress,
        textColor: textColor,
        color: backgroundColor,
        height: height *0.07,
        minWidth: width*0.9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(text,
        style: TextStyle(fontSize: height*0.025),),
    );
  }
}
