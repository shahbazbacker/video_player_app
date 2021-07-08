import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_test/views/login/login_view.dart';
import 'package:video_player_test/views/signup/signup_view.dart';

import '../../constants.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: new Container(
              padding: EdgeInsetsDirectional.only(
                  start: size.width * 0.04, end: size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => LoginView(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 45,
                      width: widthSize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: 0.5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: kGreenColor),
                      child: Text(
                        'Log in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => SignUpView(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: kGreenColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      // gradient: LinearGradient(
                      //     begin: Alignment.centerLeft,
                      //     end: Alignment.centerRight,
                      //     colors: [Colors.amberAccent, Colors.amber])),
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  //APP Login

}
