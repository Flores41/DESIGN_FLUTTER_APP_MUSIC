import 'package:flutter/material.dart';
import 'package:ui_02/src/widgets/widgets.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundColor(),
          Column(
            children: [
              CustomAppBar(),
              CustomPlayer(),
              CustomPlayerButton(),
                Expanded(child: CustomLyicsMusic()),
            ],
          ),
          
        ],
      ),
    );
  }
}

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.75,
  
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),

        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28),
         
          ],
        ),
      ),
    );
  }
}
