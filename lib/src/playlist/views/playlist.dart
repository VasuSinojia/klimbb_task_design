import 'package:flutter/material.dart';
import 'package:klimbb_project_task/common/app_images/app_images.dart';
import 'package:klimbb_project_task/common/widgets/fav_song_widget.dart';
import 'package:klimbb_project_task/src/songs/views/song.dart';

import '../../home/views/home.dart';

class PlayList extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const PlayList(this.image, this.title, this.subtitle, {super.key});

  final songList = const [
    PlayListModel(
        AppImages.playListImage1, "You right", "Doja Cat, The Weeknd", "3:58"),
    PlayListModel(AppImages.playListImage2, "2 AM", "Arizona Zervas", "3:03"),
    PlayListModel(
        AppImages.playListImage3, "Baddest", "2 Chainz, Chris Brown", "3:51"),
    PlayListModel(AppImages.playListImage4, "True Love", "Kanye West", "4:52"),
    PlayListModel(
        AppImages.playListImage5, "Bye Bye", "Marshmello, Juice WRLD", "2:09"),
    PlayListModel(
        AppImages.playListImage6, "Hands on you", "Austin George", "3:56"),
    PlayListModel(
        AppImages.playListImage6, "Hands on you", "Austin George", "3:56"),
    PlayListModel(
        AppImages.playListImage6, "Hands on you", "Austin George", "3:56"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz, color: Colors.white),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // tileMode: TileMode.mirror,
            stops: [0.0, 0.6, 1.0],
            colors: [
              Color(0xFF892FE0),
              Colors.black,
              Color(0xFF892FE0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.favorite_border,
                            size: 50,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Song(image, title, subtitle),
                              ),
                            ),
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: const ShapeDecoration(
                                gradient: SweepGradient(
                                  center: Alignment(0.18, 1.04),
                                  // startAngle: 0.28,
                                  // endAngle: -0.84,
                                  colors: [
                                    Color(0xFF842ED7),
                                    Color(0xFFDA28A8),
                                    Color(0xFF9C1CC9)
                                  ],
                                ),
                                shape: OvalBorder(),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: songList.length,
                itemBuilder: (context, index) => FavSongWidget(
                  songList[index].image,
                  songList[index].title,
                  songList[index].subtitle,
                  songList[index].duration,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
