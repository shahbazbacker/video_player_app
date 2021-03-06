import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player_test/services/remote_services.dart';
import 'package:video_player_test/views/loginsignup/login_signup_view.dart';
import 'package:get/get.dart';
import 'package:video_player_test/views/otp_view/otp_view.dart';

class LoginController extends GetxController {
  var isLoading = true.obs;
  final box = GetStorage();

  // bool get isOtpScreen => box.read('isOtp') ?? false;

  String phoneNumber;
  // bool OtpRoute = false;

  @override
  void onInit() {
    final box = GetStorage();
    super.onInit();
  }

  Future fetchLogin(phoneNumber) async {
    if (phoneNumber.length < 10) {
      Get.snackbar("Error", "Enter 10 digit phone number",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      try {
        isLoading(true);
        var homeData = await RemoteServices.fetchLogin(phoneNumber);
        if (homeData != null) {
          if (homeData.status == "success") {
            print("routed to otpscreen");
            print("phone number ${phoneNumber}");
            print("phone number from box ${box.read("phoneNumber")}");

            Get.to(() => OtpView());
            box.write('phoneNumber', phoneNumber);
          } else {
            Get.snackbar("Error", "No user found with that number",
                snackPosition: SnackPosition.BOTTOM);
            box.write('phoneNumber', '');
            print("phone number from box ${box.read("phoneNumber")}");
          }
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
