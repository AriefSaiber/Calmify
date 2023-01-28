import 'package:flutter/material.dart';
import 'package:Calmify/Menus/Meditation.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../pages/home_page.dart';
import 'MediDone.dart';

class ProgressivePage extends StatefulWidget {
  const ProgressivePage({super.key});

  @override
  State<ProgressivePage> createState() => _ProgressivePageState();
}

class _ProgressivePageState extends State<ProgressivePage> {
  late YoutubePlayerController controller;
  bool isPressed = true;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=D7QoBABZu8k';
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
  }

  Future<bool?> showWarning(BuildContext context) async {
    showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Please press the back button on screen'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('OKAY')),
              ],
            ));
    return false;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller,
            ),
            builder: (context, player) => Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Get.to(MediDone());
                  },
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
                body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 56, 2, 58),
                      Color.fromARGB(255, 97, 3, 100),
                      Color.fromARGB(255, 127, 3, 131),
                    ],
                  )),
                  child: Column(
                    children: <Widget>[
                      Positioned(
                        child: SafeArea(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MeditationPage(
                                                  showHomePage: () {},
                                                )),
                                      );
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      size: 38,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 90,
                                    top: 15,
                                    child: Text('Progressive Meditation',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontFamily: 'Abalone',
                                          color: Colors.white,
                                        )))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(child: player),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 0),
                                child: Text(
                                    'Fun Fact: Doctors have used progressive muscle relaxation in combination with standard treatments for symptom relief in a number of conditions',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Stack(
                                  children: <Widget>[
                                    // Stroked text as border.
                                    Container(
                                      width: 500,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 94, 94, 94)
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 10),
                                      child: Text(
                                        '4 Steps to Progressive Meditation',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Abalone',
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 25),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "1. While inhaling, contract one muscle group for 5 seconds to 10 seconds, then exhale and release the tension in that muscle.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          text:
                                              "2. Give yourself 10 seconds to 20 seconds to relax, and then move on to the next muscle group. ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          text:
                                              "3. Focus on the changes you feel when the muscle group is relaxed. ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          text:
                                              "4. Gradually work your way up the body contracting and relaxing muscle groups. ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
      );
}
