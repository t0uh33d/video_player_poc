import 'dart:developer';
import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class FlickVideoPlayerPackage extends StatefulWidget {
  const FlickVideoPlayerPackage({super.key});

  @override
  State<FlickVideoPlayerPackage> createState() =>
      _FlickVideoPlayerPackageState();
}

class _FlickVideoPlayerPackageState extends State<FlickVideoPlayerPackage> {
  FlickManager? flickManager;
  VideoPlayerController? videoPlayerController;
  Duration? prevPosition;
  RxString fileName = ''.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://t0uh33d.github.io/Space%20Ship%20-%203.mp4');
    flickManager = FlickManager(videoPlayerController: videoPlayerController!);

    // flickManager!.flickControlManager!.addListener(() {
    //   log(flickManager!.flickControlManager!.isFullscreen.toString());
    // });
  }

  void exitFullScreenWebCallBack() {
    prevPosition = flickManager!.flickVideoManager!.videoPlayerValue!.position;
    flickManager!.handleChangeVideo(VideoPlayerController.network(
        'https://t0uh33d.github.io/Space%20Ship%20-%203.mp4'));
    flickManager!.flickControlManager!
        .addListener(exitFullScreenCallBackListener);
    setState(() {});
  }

  void exitFullScreenCallBackListener() {
    if (flickManager!.flickVideoManager!.isVideoInitialized) {
      log("seeking to ${prevPosition?.inSeconds}");
      flickManager!.flickControlManager!
          .seekTo(prevPosition ?? const Duration(seconds: 0));
      flickManager!.flickControlManager!
          .removeListener(exitFullScreenCallBackListener);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flickManager?.dispose();
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
            SizedBox(
              height: kIsWeb ? 500 : null,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: FlickVideoPlayer(flickManager: flickManager!),
              ),
            ),
            TextButton(
                onPressed: exitFullScreenWebCallBack,
                child: const Text("web full screen exit call back")),
            Obx(() {
              return fileName.value.isNotEmpty
                  ? Image.file(File(fileName.value))
                  : const SizedBox();
            })
          ],
        ));
  }
}
