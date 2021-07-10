import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key key}) : super(key: key);
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return new Scaffold(
      body: Column(
        children: [
          _personalInfoSection(size),
          _personalDetailSection(size),
        ],
      ),
    );
  }

  Widget _personalInfoSection(Size size) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.04,
          end: size.width * 0.04,
          top: size.height * 0.0400),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/profile.png",
                height: size.height * 0.150,
              ),
              SizedBox(width: size.width * 0.0350),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    box.read("userName"),
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Text(
                    box.read("userEmail"),
                    style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: Color(0xff686868),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _personalDetailSection(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                box.read("userName"),
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                // widget.product.is_favorite == "true" ? Icons.favorite :
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0xff686868),
              ),
            ],
          ),
          Divider(
            color: Color(0xff686868),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                box.read("userPhone"),
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                // widget.product.is_favorite == "true" ? Icons.favorite :
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0xff686868),
              ),
            ],
          ),
          Divider(
            color: Color(0xff686868),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                box.read("userEmail"),
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                // widget.product.is_favorite == "true" ? Icons.favorite :
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0xff686868),
              ),
            ],
          ),
          Divider(
            color: Color(0xff686868),
          )
        ],
      ),
    );
  }
}
