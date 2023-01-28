import 'package:flutter/material.dart';
import 'package:Calmify/Meditation/MediDone.dart';
import 'package:Calmify/Menus/Meditation.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../pages/home_page.dart';

class LovingPage extends StatefulWidget {
  const LovingPage({super.key});

  @override
  State<LovingPage> createState() => _LovingPageState();
}

class _LovingPageState extends State<LovingPage> {
  late YoutubePlayerController controller;
  bool isPressed = true;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=yCt6AYI3kHU';
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
                      Color.fromARGB(255, 54, 54, 54),
                      Color.fromARGB(255, 158, 47, 65),
                      Color.fromARGB(255, 189, 88, 103),
                    ],
                  )),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: SafeArea(
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Expanded(
                                  child: Positioned(
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
                                ),
                                Expanded(
                                  child: Positioned(
                                      left: 75,
                                      top: 15,
                                      child: Text('Loving-kindness Meditation',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: 'Abalone',
                                            color: Colors.white,
                                          ))),
                                )
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
                                height: 40,
                              ),
                              Center(child: player),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 0),
                                child: Text(
                                  'Fun facts: Kind people tend to be more satisfied with their relationships and with their lives in general.',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 150, 37, 56)
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: Text(
                                        '4 Steps to Loving-Kindness Meditation',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Abalone',
                                          fontSize: 18,
                                          color: Colors.grey[300],
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
                                        "1. Find a comfortable position such as lying down or seated.  ",
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
                                      child: Text(
                                        "2.  Remember someone closest to our hearts and mind ",
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
                                      child: Text(
                                        "3. Picture the person showing their appreciation towards you. ",
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
                                      child: Text(
                                        "4. Picture showing appreciation towards the person. ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 70),
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
