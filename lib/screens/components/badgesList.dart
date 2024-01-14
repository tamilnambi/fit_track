import 'package:fit_track/screens/components/customBadge.dart';
import 'package:flutter/material.dart';

class BadgesList extends StatefulWidget {
  final bool walking;
  final bool running;
  final bool cycling;
  const BadgesList({super.key, required this.walking, required this.running, required this.cycling});

  @override
  State<BadgesList> createState() => _BadgesListState();
}

class _BadgesListState extends State<BadgesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 3.0,
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomBadge(onPress: (){},
          text: 'Walking',
          isPressed: widget.walking,),
          CustomBadge(onPress: (){},
          text: 'Running',
          isPressed: widget.running,),
          CustomBadge(onPress: (){},
          text: 'Cycling',
          isPressed: widget.cycling,),
        ],
      ),
    );
  }
}
