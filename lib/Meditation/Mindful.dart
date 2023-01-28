import 'package:flutter/material.dart';
import 'package:Calmify/Menus/Meditation.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../pages/home_page.dart';
import 'MediDone.dart';

class MindfulPage extends StatefulWidget {
  const MindfulPage({super.key});

  @override
  State<MindfulPage> createState() => _MindfulPageState();
}

class _MindfulPageState extends State<MindfulPage> {
  late YoutubePlayerController controller;
  bool isPressed = true;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=lNpuUk55kuI';
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
                      Color.fromARGB(255, 8, 25, 87),
                      Color.fromARGB(255, 30, 43, 88),
                      Color.fromARGB(255, 97, 76, 191),
                    ],
                  )),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Positioned(
                          child: SafeArea(
                            child: Container(
                              height: 40,
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
                                      left: 80,
                                      top: 15,
                                      child: Text('Mindfulness Meditation',
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
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: ListView(
                            children: [
                              Center(child: player),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 0),
                                child: Text(
                                  'Tips: You can practice mindfulness in any action you perform everyday',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
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
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 30, 43, 88)
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50.0, vertical: 10),
                                        child: Text(
                                          '3 Steps to Mindful Meditation',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Abalone',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
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
                                        "1. Step out of autopilot and focus on your body. ",
                                        // textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
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
                                              "2. Bring awareness to your breathing for six breaths or 90 seconds. ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
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
                                              "3. Be aware of your body behaviour, needs and sensations. ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50),
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
