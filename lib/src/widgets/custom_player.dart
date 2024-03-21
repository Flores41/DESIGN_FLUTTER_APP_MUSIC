import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class CustomPlayer extends StatelessWidget {
  const CustomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
        width: width,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DiskImage(),
            SizedBox(width: 50),
            _ProgressBar(),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final musicProvider = Provider.of<MusicProvider>(context);
    return SizedBox(
      child: Column(
        children: [
          CustomText(
            text: musicProvider.musicDuration,
            colors: Colors.white,
            opacity: 0.4,
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              PlayerBar(
                colors: Colors.white.withOpacity(0.1),
                height: (height * 0.27),
                width: width * 0.01,
              ),
              Positioned(
                bottom: 0,
                child: PlayerBar(
                  colors: Colors.white.withOpacity(0.8),
                  height: (height * 0.27) * musicProvider.getPercentage,
                  width: 3,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: musicProvider.musicCurrentDuration,
            colors: Colors.white,
            opacity: 0.4,
          )
        ],
      ),
    );
  }
}

class PlayerBar extends StatelessWidget {
  const PlayerBar(
      {super.key,
      this.colors = Colors.transparent,
      this.height = 0,
      this.width = 0});

  final Color? colors;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: colors),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.text = '',
    this.colors = Colors.transparent,
    this.opacity = 0.0,
  });
  final String? text;
  final Color? colors;
  final double? opacity;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: colors!.withOpacity(opacity!),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _DiskImage extends StatelessWidget {
  const _DiskImage();

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        SpinPerfect(
          delay: const Duration(milliseconds: 500),
          infinite: true,
          manualTrigger: true,
          controller: (animationController) {
            musicProvider.controller = animationController;
          },
          child: CicleDisk(
            height: height * 0.275,
            width: width * 0.55,
            colors: Colors.white,
            circular: 200,
            listColors: const [
              Color(0xff484750),
              Color(0xff1E1C24),
            ],
          ),
        ),
        CustomContainer(
          colors: Colors.black38,
          height: height * 0.025,
          width: width * 0.05,
        ),
        CustomContainer(
          colors: const Color(0xff1c1c25),
          height: height * 0.0125,
          width: width * 0.025,
        ),
      ],
    );
  }
}

class CicleDisk extends StatelessWidget {
  const CicleDisk(
      {super.key,
      required this.height,
      required this.width,
      this.colors = Colors.transparent,
      this.image = 'assets/aurora.jpg',
      this.spreadRadius = 0,
      this.opacity = 0,
      this.opacityColor = Colors.transparent,
      this.circular = 0,
      this.listColors = const [
        Color.fromARGB(0, 72, 71, 80),
        Color.fromARGB(0, 30, 28, 36),
      ]});

  final double height;
  final double width;
  final Color? colors;
  final String? image;
  final double? spreadRadius;
  final double? opacity;
  final Color? opacityColor;
  final double? circular;
  final List<Color>? listColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors,
        gradient: LinearGradient(begin: Alignment.topLeft, colors: listColors!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circular!),
        child: Image(
          image: AssetImage(image!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height = 0,
    this.width = 0,
    this.colors = Colors.transparent,
  });

  final double? height;
  final double? width;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colors,
        shape: BoxShape.circle,
      ),
    );
  }
}
