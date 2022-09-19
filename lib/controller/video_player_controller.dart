import 'dart:developer';

import 'package:get/get.dart';

class VideoPlayerCustomController extends GetxController {
  String currentVideoLink = '';
  double aspectRatio = 0;

  void getAspectRatio() {
    aspectRatio = Get.height / Get.width;
    log(aspectRatio.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAspectRatio();
  }
}
