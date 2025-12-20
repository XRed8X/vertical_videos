import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vertical_videos/config/helpers/human_formats.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({super.key, required this.video});

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButtons(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.white,
        ),
        _CustomIconButtons(value: video.views, iconData: Icons.remove_red_eye),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: _CustomIconButtons(
            value: 0, 
            iconData: Icons.play_circle_outline
          )
        )
      ],
    );
  }
}

class _CustomIconButtons extends StatelessWidget {
  const _CustomIconButtons({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  final int value;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color, size: 30),
        ),
        if (value > 0)
        Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}
