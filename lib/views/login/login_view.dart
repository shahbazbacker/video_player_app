import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_test/constants.dart';
import 'package:video_player_test/controllers/login_controller.dart';
import 'package:video_player_test/views/loginsignup/login_signup_view.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _textLoginMobController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return SafeArea(
      child: new Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: AppbarWidget(context),
                flex: 1,
              ),
              Expanded(
                child: _loginIntroText(size),
                flex: 2,
              ),
              Expanded(
                child: _loginInput(size),
                flex: 3,
              ),
              Expanded(
                child: _authButtons(widthSize, size),
                flex: 2,
              ),
            ],
          )),
    );
  }

  _loginIntroText(Size size) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.04, end: size.width * 0.04),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                  child: Text(
                "Welcome Back",
                style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                child: Text(
              "If You already have an account,enter \n your phone number below",
              style: TextStyle(
                  fontSize: size.width * 0.05, color: Color(0xff686868)),
            )),
          ),
        ],
      ),
    );
  }

  _loginInput(Size size) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.04, end: size.width * 0.04),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Mobile Number",
              style:
                  TextStyle(fontSize: size.width * 0.035, color: kGreenColor),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _textLoginMobController,
            decoration: new InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGreenColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGreenColor, width: 2),
              ),
            ),
            autofocus: true,
          ),
        ],
      ),
    );
  }

  _authButtons(double widthSize, Size size) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.04, end: size.width * 0.04),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              loginController
                  .fetchLogin(_textLoginMobController.text.toString());
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
    );
  }
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
      Align(
        alignment: Alignment(-0.6, 0.4),
        child: Text("Login",
            style: TextStyle(
                fontSize: 24,
                color: Color(0xff2B2B2B),
                fontWeight: FontWeight.w600)),
      ),
    ]),
  );
}
