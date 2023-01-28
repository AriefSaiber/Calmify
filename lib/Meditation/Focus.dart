import 'package:flutter/material.dart';
import 'package:Calmify/Meditation/MediDone.dart';
import 'package:Calmify/Menus/Meditation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../pages/home_page.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  late YoutubePlayerController controller;
  bool isPressed = true;

  @override
  void initState() {
    super.initState();
    const url = 'https://youtu.be/ausxoXBrmWs';
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MediDone()),
                    );
                  },
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
                body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Color.fromARGB(255, 0, 59, 48),
                      Color.fromARGB(255, 0, 119, 95),
                    ],
                  )),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            height: 40,
                            width: 500,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
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
                                SizedBox(
                                  width: 40,
                                ),
                                Text('Focused Meditation',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontFamily: 'Abalone',
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                          Column(
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
                                    'Tips: You will need to find a quiet place where you wont be interrupted. These short sessions can be practiced anywhere at any time',
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
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 117, 94)
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: Text(
                                        '5 Steps to Focused Meditation',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Violet',
                                          fontSize: 22,
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
                                        "1. Focus on your breath. ",
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
                                        "2. Get into a comfortable sitting position. ",
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
                                        "3. Loosen your shoulders and breathe from your belly. ",
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
                                        "4. Always turn your attention to your breathing. ",
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
                                        "5. Calm your inner voice. ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 120),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))),
      );
}
