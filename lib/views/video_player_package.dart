import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_poc/controller/video_player_controller.dart';

class VideoPlayerPackage extends StatefulWidget {
  const VideoPlayerPackage({super.key});

  @override
  State<VideoPlayerPackage> createState() => _VideoPlayerPackageState();
}

class _VideoPlayerPackageState extends State<VideoPlayerPackage> {
  VideoPlayerController? videoPlayerController;
  VideoPlayerCustomController videoPlayerCustomController =
      Get.put(VideoPlayerCustomController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://t0uh33d.github.io/Space%20Ship%20-%203.mp4')
      ..initialize().then((value) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('video player'),
          elevation: 0,
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: videoPlayerController!.value.aspectRatio,
              child: videoPlayerController!.value.isInitialized
                  ? Stack(children: [
                      VideoPlayer(videoPlayerController!),
                      Text("jvbfjbvn"),
                    ])
                  : Container(
                      color: Colors.red,
                    ),
            ),
            Text("${videoPlayerController!.value.aspectRatio}")
          ],
        )

        // SizedBox(
        //   width: Get.width,
        //   height: 200,
        //   child: VideoPlayer(videoPlayerController!),
        // ),
        );
  }
}
