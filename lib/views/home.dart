import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_poc/views/flick_video_player.dart';
import 'package:video_player_poc/views/html_view_block.dart';
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
          title: const Text('School of Stocks POC'),
          elevation: 0,
        ),
        body: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '    --> Video Player',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: () => Get.to(const VideoPlayerPackage()),
                  child: const Text("          - Video player package")),
              TextButton(
                  onPressed: () => Get.to(const FlickVideoPlayerPackage()),
                  child: const Text("          - Flick Video player package")),
              const Divider(),
              const Text(
                '    --> Open Edx Block Rendering',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 10),
                child: Image.asset(
                  'assets/open_edx_dashboard_blocks.png',
                  // height: 300,
                  width: 300,
                ),
              ),
              TextButton(
                  onPressed: () =>
                      Get.to(HTMLViewBlock(blockType: BlockType.html)),
                  child: const Text("          - Custom HTML Block")),
              TextButton(
                  onPressed: () =>
                      Get.to(HTMLViewBlock(blockType: BlockType.problem)),
                  child: const Text("          - Problem Block")),
              TextButton(
                  onPressed: () =>
                      Get.to(HTMLViewBlock(blockType: BlockType.video)),
                  child: const Text("          - Video Block")),
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
