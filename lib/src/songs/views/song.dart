import 'package:flutter/material.dart';
import 'package:klimbb_project_task/common/app_colors/app_colors.dart';

class Song extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const Song(this.image, this.title, this.subtitle, {super.key});

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
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // tileMode: TileMode.mirror,
            stops: [0.0, 0.3, 0.7, 1.0],
            colors: [
              Color(0xFF892FE0),
              Colors.black,
              Colors.black,
              Color(0xFF892FE0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                width: double.infinity,
                height: 350,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing:
                    const Icon(Icons.favorite_border, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: LinearProgressIndicator(
                  value: 0.3,
                  color: Colors.white,
                  backgroundColor: AppColors.sharedInstance.lightGrey,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Text(
                      "1:24",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "3:58",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  const Icon(Icons.shuffle, color: Colors.white),
                  const Spacer(),
                  const Icon(Icons.skip_previous,
                      color: Colors.white, size: 40),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
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
                      Icons.pause,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.skip_next, color: Colors.white, size: 40),
                  const Spacer(),
                  const Icon(Icons.shuffle, color: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
