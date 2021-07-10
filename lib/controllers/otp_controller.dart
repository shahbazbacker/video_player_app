import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player_test/models/otp_model.dart';
import 'package:video_player_test/services/remote_services.dart';
import 'package:video_player_test/views/loginsignup/login_signup_view.dart';
import 'package:get/get.dart';
import 'package:video_player_test/views/videolist/videolist.dart';

class OtpController extends GetxController {
  var isLoading = true.obs;
  final box = GetStorage();

  // bool get isOtpScreen => box.read('isOtp') ?? false;
  User profileUser;

  String otpEntered;
  // bool OtpRoute = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future fetchOtp(otpEntered) async {
    if (otpEntered.length < 4) {
      Get.snackbar("Error", "Enter 4 digit otp number",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      try {
        isLoading(true);
        var homeData =
            await RemoteServices.fetchOtp(box.read("phoneNumber"), otpEntered);
        if (homeData != null) {
          if (homeData.status == "success") {
            print("routed to otpscreen");

            Get.to(() => VideoListView());
            box.write('isLoggedIn', true);
            box.write('otpNumber', otpEntered);
            print("otp in box phone is ${box.read("phoneNumber")}");
            profileUser = homeData.user;

            box.write("userName", profileUser.name);
            box.write("userPhone", profileUser.phone);
            box.write("userEmail", profileUser.email);
          } else {
            Get.snackbar("Error", "Entered otp is wrong",
                snackPosition: SnackPosition.BOTTOM);
            box.write('otpNumber', '');
            print("otp in box phone is ${box.read("phoneNumber")}");
            box.write('isLoggedIn', false);
            box.write("userName", '');
            box.write("userPhone", '');
            box.write("userEmail", '');
          }
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
