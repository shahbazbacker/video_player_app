import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:video_player_test/models/login_model.dart';
import 'package:video_player_test/models/otp_model.dart';

var dio = Dio(BaseOptions(headers: {
  "Content-Type": "application/x-www-form-urlencoded",
  "Accept": "application/json"
}));
Response response;

class RemoteServices {
  // static fetchHome() async {
  //   response = await dio.get('http://139.59.89.155/api/v1/home/');
  //   print("response is");
  //   print(response.data);
  //   // Optionally the request above could also be done as
  //   print("home model is");

  //   // String jsonDataToString = jsonDecode(response.data);

  //   print(HomeModel.fromJson(response.data));
  //   return HomeModel.fromJson(response.data);
  // }

  static fetchLogin(String phoneNumber) async {
    response = await dio.post('http://139.59.89.155/api/v1/otp/login/', data: {
      "phone": phoneNumber,
      "request_id": '55',
    });

    print(phoneNumber);

    print(response.data);
    // Optionally the request above could also be done as
    print("home model is");

    // String jsonDataToString = jsonDecode(response.data);

    print(LoginModel.fromJson(response.data));
    return LoginModel.fromJson(response.data);
  }

  static fetchOtp(String phoneNumber, String otpEntered) async {
    response =
        await dio.post('http://139.59.89.155/api/v1/otp/login/verify/', data: {
      "phone": phoneNumber,
      "code": otpEntered,
      "request_id": '55',
    });

    print(phoneNumber);

    print(response.data);
    // Optionally the request above could also be done as
    print("home model is");

    // String jsonDataToString = jsonDecode(response.data);

    print(OtpModel.fromJson(response.data));
    return OtpModel.fromJson(response.data);
  }
}
