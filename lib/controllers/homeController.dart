import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player_test/models/video_model.dart';
import 'package:video_player_test/services/remote_services.dart';

import 'package:get/get.dart';
import 'package:video_player_test/views/otp_view/otp_view.dart';

class VideoController extends GetxController {
  var isLoading = true.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }
}
