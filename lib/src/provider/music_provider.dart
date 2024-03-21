import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class MusicProvider with ChangeNotifier {
  late AnimationController _animationController;
  AnimationController get getcontroller => _animationController;

  bool _isPlaying = false;
  bool get getIsPlaying => _isPlaying;

  Duration _musicDuration = const Duration(milliseconds: 0);
  Duration get getDuration => _musicDuration;

  Duration _current = const Duration(milliseconds: 0);
  Duration get getCurrent => _current;

  double get getPercentage => _musicDuration.inSeconds > 0
      ? _current.inSeconds / _musicDuration.inSeconds
      : 0.0;

  String get musicDuration => printDuration(_musicDuration);
  String get musicCurrentDuration => printDuration(_current);

  set controller(AnimationController value) {
    _animationController = value;
  }

  set setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  set setDuration(Duration duration) {
    _musicDuration = duration;
    notifyListeners();
  }

  set setCurrent(Duration current) {
    _current = current;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
