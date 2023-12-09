import 'package:flutter/material.dart';
import 'package:klimbb_project_task/common/app_colors/app_colors.dart';

class FavSongWidget extends StatelessWidget {
  final String imagePath;
  final String songName;
  final String playListName;
  final String duration;

  const FavSongWidget(
      this.imagePath, this.songName, this.playListName, this.duration,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath, height: 55, width: 55),
      title: Text(
        songName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        playListName,
        style: TextStyle(
          color: AppColors.sharedInstance.lightGrey,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        duration,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
