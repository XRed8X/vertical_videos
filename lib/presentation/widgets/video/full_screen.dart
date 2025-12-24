import 'package:flutter/material.dart';
import 'package:vertical_videos/presentation/widgets/video/gradiend_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  final String videoUrl;
  final String caption;

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        return GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
              return;
            }
            _controller.play();
            // _controller.value.isPlaying
            //     ? _controller.pause()
            //     : _controller.play();
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),

                // Gradient Overlay
                GradientBackground(
                  stops: const [0.7, 1.0],
                ),
                // Text Caption
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  const _VideoCaption({required this.caption});

  final String caption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStryles = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: textStryles),
    );
  }
}
