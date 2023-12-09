import 'package:flutter/material.dart';
import 'package:klimbb_project_task/common/app_colors/app_colors.dart';

class SongCardWidget extends StatelessWidget {
  final String imagePath;
  final String songName;
  final String playListName;

  const SongCardWidget(this.imagePath, this.songName, this.playListName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 210,
              width: 210,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            songName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            playListName,
            style: TextStyle(
              color: AppColors.sharedInstance.lightGrey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
