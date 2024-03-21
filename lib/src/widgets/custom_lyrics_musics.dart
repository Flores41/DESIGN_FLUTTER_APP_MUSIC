import 'package:flutter/material.dart';
import 'package:ui_02/src/theme/helpers.dart';

class CustomLyicsMusic extends StatelessWidget {
  const CustomLyicsMusic({super.key});

  @override
  Widget build(BuildContext context) {
   
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final lyrics = getLyrics();
    return SizedBox(
      width: width * 0.85,
      height: height * 0.2,

      child: ListWheelScrollView(
          itemExtent: 50,
          diameterRatio: 3.5,
          physics: const BouncingScrollPhysics(),
          children: lyrics
              .map((e) => Text(
                    e,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ))
              .toList()),
    );
  }
}
