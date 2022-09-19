import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_poc/views/flick_video_player.dart';
import 'package:video_player_poc/views/video_player_package.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('video player'),
          elevation: 0,
        ),
        body: Container(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Get.to(const VideoPlayerPackage()),
                  child: const Text("Video player package")),
              TextButton(
                  onPressed: () => Get.to(const FlickVideoPlayerPackage()),
                  child: const Text("Flick Video player package")),
            ],
          ),
        )

        // SizedBox(
        //   width: Get.width,
        //   height: 200,
        //   child: VideoPlayer(videoPlayerController!),
        // ),
        );
  }
}
