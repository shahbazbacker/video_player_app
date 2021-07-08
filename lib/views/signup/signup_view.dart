import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_test/constants.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController _textLoginMobController =
      new TextEditingController();
  final TextEditingController _textLoginNameController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
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
                child: _loginbuttons(widthSize, size),
                flex: 2,
              ),
            ],
          ),
        ));
  }

  //APP Login

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
                "Let's get started",
                style: TextStyle(
                    fontSize: size.width * 0.07, fontWeight: FontWeight.w600),
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
              "create account to see our top picks for \n you!",
              style: TextStyle(
                  fontSize: size.width * 0.05, color: Colors.grey[700]),
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
              "Your Name",
              style:
                  TextStyle(fontSize: size.width * 0.035, color: kGreenColor),
            ),
          ),
          TextField(
            keyboardType: TextInputType.name,
            controller: _textLoginNameController,
            decoration: new InputDecoration(
              hintText: "Enter your Name",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGreenColor, width: 2),
              ),
            ),
            autofocus: true,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _textLoginMobController,
            decoration: new InputDecoration(
              hintText: "Mobile Number",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
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

  _loginbuttons(double widthSize, Size size) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.04, end: size.width * 0.04),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (_textLoginMobController.text.toString().length == 0) {
                final snackBar = SnackBar(content: Text("Enter Username"));
              } else {
                // doLogin(
                //   _textLoginMobController.text.toString(),
                // );
              }
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
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
    ]),
  );
}
