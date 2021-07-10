import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:video_player/video_player.dart';
import 'package:video_player_test/constants.dart';
import 'package:video_player_test/controllers/video_controller.dart';
import 'package:video_player_test/views/main_drawer/main_drawer.dart';
import 'package:video_player_test/views/video_detail/change_notifier.dart';
import 'package:video_player_test/views/video_detail/theme.dart';
import 'package:video_player_test/views/video_detail/themechange.dart';

class ChewieDemo extends StatefulWidget {
  const ChewieDemo({
    Key key,
    this.title = 'Chewie Demo',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
  String dura;
  final box = GetStorage();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4');
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    // final subtitles = [
    //     Subtitle(
    //       index: 0,
    //       start: Duration.zero,
    //       end: const Duration(seconds: 10),
    //       text: 'Hello from subtitles',
    //     ),
    //     Subtitle(
    //       index: 0,
    //       start: const Duration(seconds: 10),
    //       end: const Duration(seconds: 20),
    //       text: 'Whats up? :)',
    //     ),
    //   ];

    final subtitles = [
      Subtitle(
        index: 0,
        start: Duration.zero,
        end: const Duration(seconds: 10),
      ),
      Subtitle(
          index: 0,
          start: const Duration(seconds: 10),
          end: const Duration(seconds: 20),
          text: 'Whats up? :)'
          // text: const TextSpan(
          //   text: 'Whats up? :)',
          //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
          // ),
          ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,

      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),

      // Try playing around with some of these other options:

      showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),

      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
            child: Column(children: [
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
                        box.read("userName"),
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
                trailing: IconButton(
                    icon: const Icon(Icons.brightness_high),
                    onPressed: () {
                      currentTheme.switchTheme();
                    }),
              ),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(() {
                // If the video is playing, pause it.
                _chewieController.enterFullScreen();
              });
            },
            // Display the correct icon depending on the state of the player.
            child: Icon(
              _videoPlayerController1.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
          body: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.261,
                child: _chewieController != null &&
                        _chewieController
                            .videoPlayerController.value.isInitialized
                    ? Chewie(
                        controller: _chewieController,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Loading'),
                        ],
                      ),
              ),
              TextButton(
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 5,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 5,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/icons/profile.png",
                    width: 45,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_videoPlayerController1.value.isPlaying) {
                      _videoPlayerController1.pause();
                    } else {
                      // If the video is paused, play it.
                      _videoPlayerController1.play();
                    }
                  });
                },
                child: Align(
                  alignment: Alignment(-0.9, -0.6),
                  child: _videoPlayerController1.value.isPlaying
                      ? Icon(
                          Icons.pause,
                          size: 55,
                          color: Colors.white,
                        )
                      : Image.asset("assets/icons/play.png", width: 30),
                ),
              ),
              Align(
                alignment: Alignment(0.7, -0.54),
                child: Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _chewieController.enterFullScreen();
                  });
                },
                child: Align(
                  alignment: Alignment(0.9, -0.55),
                  child: Icon(
                    Icons.fullscreen,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(1, -0.60),
                child: Container(
                  width: 350,
                  child: ValueListenableBuilder(
                    valueListenable: _videoPlayerController1,
                    builder: (context, VideoPlayerValue value, child) {
                      //Do Something with the value.
                      if (_videoPlayerController1.value.isInitialized &&
                          _videoPlayerController1.value.isPlaying) {
                        return new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 180,
                          lineHeight: 5.0,
                          percent: (value.position.inSeconds.toDouble() /
                              value.duration.inSeconds.toDouble()),
                          linearStrokeCap: LinearStrokeCap.butt,
                          backgroundColor: Colors.grey,
                          progressColor: kGreenColor,
                        );
                      } else {
                        return new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 180,
                          lineHeight: 5.0,
                          percent: 0.0,
                          linearStrokeCap: LinearStrokeCap.butt,
                          backgroundColor: Colors.grey[600],
                          progressColor: Colors.amber,
                        );
                      }
                    },
                  ),
                ),
              ),
              Center(
                  child:
                      Text(_videoPlayerController1.value.position.toString())),
            ],
          ),
        ),
      ),
    );
  }
}
