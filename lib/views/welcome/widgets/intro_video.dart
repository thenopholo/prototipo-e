import 'package:eveo_app/views/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class IntroVideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const IntroVideo({
    required this.videoPlayerController,
    this.looping = false,
    Key? key,
  }) : super(key: key);

  @override
  State<IntroVideo> createState() => _IntroVideoState();
}

class _IntroVideoState extends State<IntroVideo> {
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 9 / 16,
      autoInitialize: true,
      autoPlay: true,
      fullScreenByDefault: true,
      showControls: false,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
    widget.videoPlayerController.addListener(() {
      if (widget.videoPlayerController.value.position ==
          widget.videoPlayerController.value.duration) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Chewie(
          controller: _chewieController!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController!.dispose();
  }
}
