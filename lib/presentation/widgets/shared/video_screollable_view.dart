import 'package:flutter/material.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/presentation/widgets/shared/video_buttons.dart';
import 'package:vertical_videos/presentation/widgets/video/full_screen.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            // video Player + gradient overlay
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl, 
                caption: videoPost.caption
              )
            ),
            // Buttons
            Positioned(
              right: 20,
              bottom: 40,
              child: 
                VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}
