import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player_test/services/remote_services.dart';
import 'package:video_player_test/views/loginsignup/login_signup_view.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var isLoading = true.obs;
  final box = GetStorage();

  // bool get isOtpScreen => box.read('isOtp') ?? false;

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

            Get.to(LoginSignupView());
            box.write('otpNumber', otpEntered);
            print("otp in box phone is ${box.read("phoneNumber")}");
          } else {
            Get.snackbar("Error", "Entered otp is wrong",
                snackPosition: SnackPosition.BOTTOM);
            box.write('otpNumber', '');
            print("otp in box phone is ${box.read("phoneNumber")}");
          }
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
