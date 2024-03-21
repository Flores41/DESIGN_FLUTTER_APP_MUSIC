import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class CustomPlayerButton extends StatelessWidget {
  const CustomPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 61, top: 50),
      child: SizedBox(
        width: width * 0.86,
        child: Row(
          children: [
            const TitleMusic(),
            const Spacer(),
            IconPlayMusic(
              height: height,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}

class IconPlayMusic extends StatefulWidget {
  const IconPlayMusic({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<IconPlayMusic> createState() => _IconPlayMusicState();
}

class _IconPlayMusicState extends State<IconPlayMusic>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool _isPlaying = false;
  bool _firstTime = true;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void open() {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    assetsAudioPlayer.open(
      Audio('assets/musica.mp3'),
      autoStart: true,
      showNotification: true,
      volume: 100
    );
    assetsAudioPlayer.currentPosition.listen((duration) {
      musicProvider.setCurrent = duration;
    });
    assetsAudioPlayer.current.listen((durationMusic) {
      musicProvider.setDuration =
          durationMusic?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.07,
      width: widget.width * 0.14,
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        backgroundColor: const Color(0xffF8CD51),
        onPressed: () {
          final musicProvider =
              Provider.of<MusicProvider>(context, listen: false);
          if (_isPlaying) {
            animationController.reverse();
            _isPlaying = false;
            musicProvider.getcontroller.stop();
          } else {
            animationController.forward();
            _isPlaying = true;
            musicProvider.getcontroller.repeat();
          }
          if (_firstTime) {
            open();
            _firstTime = false;
          }else{
            assetsAudioPlayer.playOrPause();
          }
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: animationController,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TitleMusic extends StatelessWidget {
  const TitleMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tengo Una Vida Perdida \n En El Desierto'.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '-Breaking Benjamin-'.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
