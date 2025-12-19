import 'package:flutter/material.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Container(color: Colors.red,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
        Container(color: Colors.black,),
        Container(color: Colors.purple,),
        Container(color: Colors.white)
      ]
    );
  }
}
