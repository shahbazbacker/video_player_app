import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player_test/models/video_model.dart';
import 'package:video_player_test/services/remote_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player_test/views/otp_view/otp_view.dart';

class VideoController extends GetxController {
  var isLoading = true.obs;
  final box = GetStorage();
  var isDark = false;

  var videolist = List<Category>().obs;

  @override
  void onInit() {
    fetchVideoList();
    super.onInit();
  }

  Future fetchVideoList() async {
    try {
      isLoading(true);
      var homeData = await RemoteServices.fetchVideoList();
      if (homeData != null) {
        if (homeData.status == "success") {
          print("video reached controller");
          videolist.value = homeData.category;
          print("video saved to list");
        } else {
          Get.snackbar("Error", "While Fetching Video List",
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void changeTheme(state) {
    if (state == true) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }
}
