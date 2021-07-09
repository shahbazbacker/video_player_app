import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_test/controllers/video_controller.dart';
import 'package:video_player_test/views/video_detail/video_detail_view.dart';

class VideoListView extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          // bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Obx(() {
                if (videoController.isLoading.value)
                  return Center(
                      child: CupertinoActivityIndicator(
                    radius: 30,
                  ));
                else
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: videoController.videolist.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            ChewieDemo(
                                // video: videoController.videolist[index],
                                ),
                          );
                        },
                        child: Card(
                          child: Row(
                            children: <Widget>[
                              Image(
                                width: 180.0,
                                image: NetworkImage(
                                    "${'http://139.59.89.155'}${videoController.videolist[index].image}"),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        videoController.videolist[index].name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      videoController
                                          .videolist[index].description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
              })
            ],
          ),
        ),
      ),
    );
  }
}
