import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_02/src/pages/screen.dart';
import 'package:ui_02/src/provider/music_provider.dart';
import 'package:ui_02/src/theme/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MusicProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const MusicPlayer(),
    );
  }
}
