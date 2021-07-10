import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_test/controllers/video_controller.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key key}) : super(key: key);
  var isDark = false;

  @override
  Widget build(BuildContext context) {
    final VideoController videoController = Get.put(VideoController());

    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/profile.png",
                width: 65,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "John lee",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Software Engenieer",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Your Profile"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Theme Change"),
        trailing: Switch(
          value: videoController.isDark,
          onChanged: (state) {
            print("printing $state");
            videoController.changeTheme(state);
          },
        ),
      ),
    ]);
  }
}
