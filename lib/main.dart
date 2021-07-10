import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:video_player_test/views/loginsignup/login_signup_view.dart';
import 'package:video_player_test/views/video_detail/themechange.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginSignupView(),
      routes: {
        // "/homescreen": (_) => new GroceryHome(),
        "/login": (_) => new LoginSignupView(),
      },
    );
  }
}
