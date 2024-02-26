// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailedPage extends StatefulWidget {
  final String title;
  final String imagepath;
  final String content;
  final String yturl;
  final int index;
  const DetailedPage(this.title, this.imagepath, this.content, this.yturl,this.index, {super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  late YoutubePlayerController _controller;
  
  //final videoUrl = "https://youtu.be/GGPRFAoCRGQ?si=0mNrjHnT-sErv7OB";
   @override
  void initState() {
    String videoUrl = widget.yturl;

    // TODO: Implement initState
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    } else {
      // Handle the case where videoId is null
      print("Error: Could not extract videoId from YouTube URL.");
    }
  
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar:isLandscape?null: AppBar(
        title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: 
      
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(50.0.w),
              child: Image.asset(
                widget.imagepath,
                height: 200.h,
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: Text(widget.content),
            ),
            Text(
              'Solution Video',
              style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.bold),
            ),
           Padding(
              padding:  EdgeInsets.all(20.0.w),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                  onReady: () {
                // Enable full-screen on landscape orientation
                
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
