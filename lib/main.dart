import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/views/welcome/welcome_page.dart';
import 'package:eveo_app/views/welcome/widgets/intro_video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVEO App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: vermelho),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
      // IntroVideo(
      //   videoPlayerController: VideoPlayerController.asset(
      //     'assets/videos/intro_video.mp4',
      //   ),
      // ),
    );
  }
}
