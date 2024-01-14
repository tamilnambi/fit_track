import 'package:fit_track/data/constants.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final bool isPressed;
  final String text;
  final Function() onPress;
  const CustomBadge({super.key, required this.isPressed, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: isPressed ? primaryPink : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          child: Text(text,
          style: TextStyle(color: isPressed ? Colors.white : primaryPink),),
        ),
      ),
    );
  }
}
