import 'package:flutter/material.dart';
import 'package:klimbb_project_task/common/app_images/app_images.dart';
import 'package:klimbb_project_task/common/widgets/fav_song_widget.dart';
import 'package:klimbb_project_task/common/widgets/song_card_widget.dart';
import 'package:klimbb_project_task/src/playlist/views/playlist.dart';
import 'package:klimbb_project_task/src/songs/views/song.dart';

import '../../../common/app_colors/app_colors.dart';
import '../../../common/widgets/search_textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final kConstSize = const SizedBox(height: 15);

  late TabController _tabController;

  final tabList = const [
    "Recent",
    "Top 50",
    "Chill",
    "R&B",
    "Festival",
  ];

  final playList = const [
    PlayListModel(AppImages.bgImageCard1, "R&B Playlist", "Chill your mind"),
    PlayListModel(AppImages.bgImageCard1, "Daily Mix 2", "Made for you"),
    PlayListModel(AppImages.bgImageCard1, "Daily Mix 2", "Made for you"),
    PlayListModel(AppImages.bgImageCard1, "Daily Mix 2", "Made for you"),
  ];

  final yourFavList = const [
    PlayListModel(AppImages.favImage1, "Bye Bye", "Chill your mind", "2:09"),
    PlayListModel(AppImages.favImage2, "I Like You", "Made for you", "4:03"),
    PlayListModel(AppImages.favImage2, "Fountains", "Made for you", "3:18"),
    PlayListModel(AppImages.favImage2, "Daily Mix 2", "Made for you", "3:18"),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror,
            stops: [0.0, 0.15, 0.6, 1.0],
            colors: [
              Colors.black,
              Colors.black,
              Color(0xFF892FE0),
              Colors.black,
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "What do you feel like today?",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    color: AppColors.sharedInstance.lightGrey,
                  ),
                ),
                kConstSize,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: SearchTextField(),
                ),
                kConstSize,
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  tabs: [
                    for (String text in tabList)
                      Text(
                        text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                  ],
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    itemCount: playList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayList(playList[index].image,
                              playList[index].title, playList[index].subtitle),
                        ),
                      ),
                      child: SongCardWidget(
                        playList[index].image,
                        playList[index].title,
                        playList[index].subtitle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Your Favourites",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kConstSize,
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: yourFavList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Song(
                          yourFavList[index].image,
                          yourFavList[index].title,
                          yourFavList[index].subtitle,
                        ),
                      ),
                    ),
                    child: FavSongWidget(
                      yourFavList[index].image,
                      yourFavList[index].title,
                      yourFavList[index].subtitle,
                      yourFavList[index].duration,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayListModel {
  final String image;
  final String title;
  final String subtitle;
  final String duration;

  const PlayListModel(this.image, this.title, this.subtitle,
      [this.duration = ""]);
}
