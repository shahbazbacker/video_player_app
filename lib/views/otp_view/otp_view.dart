import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:video_player_test/constants.dart';
import 'package:video_player_test/controllers/otp_controller.dart';

class OtpView extends StatelessWidget {
  final OtpController otpController = Get.put(OtpController());
  final box = GetStorage();

  TextEditingController _textLoginOtpController =
      TextEditingController(text: "");
  String OTP = "";
  String mobile_number = "";

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            new Expanded(
              child: AppbarWidget(context),
              flex: 1,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            new Expanded(
              child: _otpIntroText(size, otpController, box),
              flex: 2,
            ),
            new Expanded(
              child: _otpTextField(),
              flex: 2,
            ),
            new Expanded(
              child: _resendCall(size),
              flex: 2,
            ),
            GestureDetector(
              onTap: () {
                otpController.fetchOtp(_textLoginOtpController.text.toString());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 45,
                width: widthSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 0.5)
                ], borderRadius: BorderRadius.circular(10), color: kGreenColor),
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _btnVerify(size) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _verifyButton(size),
      ],
    );
  }

  Widget _verifyButton(size) {
    return GestureDetector(
      onTap: () {
        print(OTP);
        // Navigator.pushReplacementNamed(context, "/register_screen");
        // doVarifyOtp(mobile_number, OTP);
      },
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        width: size.width,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(55)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(5, 4),
                  blurRadius: 20,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.amberAccent, Colors.amber])),
        child: Text(
          'VERIFY',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              letterSpacing: 1,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _otpTextField() {
    return SingleChildScrollView(
      child: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PinCodeTextField(
              autofocus: false,
              controller: _textLoginOtpController,
              hideCharacter: false,
              highlight: true,
              highlightColor: CupertinoColors.activeBlue,
              defaultBorderColor: CupertinoColors.systemGrey3,
              hasTextBorderColor: CupertinoColors.systemGrey3,
              maxLength: pinLength,
              hasError: hasError,
              maskCharacter: "🐶",
              onTextChanged: (text) {
                // setState(() {
                //   hasError = false;
                //   thisText = text;
                // });
              },
              isCupertino: true,
              onDone: (text) {
                print("DONE $text");
                OTP = text;
              },
              wrapAlignment: WrapAlignment.end,
              pinBoxHeight: 50,
              pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 12),
              pinBoxWidth: 50,
              pinBoxDecoration:
                  ProvidedPinBoxDecoration.defaultPinBoxDecoration,
              pinTextStyle: TextStyle(
                  fontSize: 30.0,
                  color: kGreenColor,
                  fontWeight: FontWeight.w600),
              pinTextAnimatedSwitcherTransition:
                  ProvidedPinBoxTextAnimation.scalingTransition,
              pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
              highlightAnimation: true,
              highlightAnimationBeginColor: kGreenColor,
              highlightAnimationEndColor: kGreenColor,
            ),
          ],
        ),
      ),
    );
  }

//Verify OTP

}

_resendCall(size) {
  return Column(
    children: [
      Text(
        "Resend code",
        style: TextStyle(
            color: kGreenColor,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: size.height * 0.03,
      ),
      Text(
        "Call me instead",
        style: TextStyle(
            color: kGreenColor,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget AppbarWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
    ),
    child: Stack(children: [
      Align(
        alignment: Alignment(-0.9, 0.3),
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Icon(
              Icons.arrow_back,
              color: kGreenColor,
            )),
      ),
    ]),
  );
}

_otpIntroText(Size size, otpController, box) {
  return Container(
    padding: EdgeInsetsDirectional.only(
        start: size.width * 0.04, end: size.width * 0.04),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                child: Text(
              "Verify your number",
              style: TextStyle(
                  fontSize: size.width * 0.07, fontWeight: FontWeight.w600),
            )),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              child: Text(
            "Enter the 4-digit code we sent to you",
            style:
                TextStyle(fontSize: size.width * 0.05, color: Colors.grey[700]),
          )),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              child: Text(
            box.read("phoneNumber"),
            style: TextStyle(
                fontSize: size.width * 0.05, fontWeight: FontWeight.w600),
          )),
        ),
      ],
    ),
  );
}
