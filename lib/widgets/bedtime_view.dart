import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/widgets/album_card.dart';
import 'package:audioplayers/audioplayers.dart';

class SleepView extends StatefulWidget {
  final ImageProvider image;

  SleepView({Key? key, required this.image}) : super(key: key);
  @override
  _SleepViewState createState() => _SleepViewState();
}

class _SleepViewState extends State<SleepView> {
  late ScrollController scrollController;
  AudioPlayer audioPlayer = AudioPlayer();
  int timeProgress = 0;
  int audioDuration = 0;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;
  PlayerState audioPlayerState = PlayerState.paused;
  String url = 'https://on.soundcloud.com/7AHdA';

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inMilliseconds;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });

    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        print(scrollController.offset);
        setState(() {});
      });
    super.initState();

    @override
    void dispose() {
      audioPlayer.release();
      audioPlayer.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.lightBlue,
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 370,
                                      child: Slider.adaptive(
                                          value: (timeProgress / 1000)
                                              .floorToDouble(),
                                          max: (audioDuration / 1000)
                                              .floorToDouble(),
                                          onChanged: (value) {
                                            seektoSec(value.toInt());
                                          })),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 35),
                                      child: Text(getTimeString(timeProgress),
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.8))),
                                    ),
                                    SizedBox(
                                      width: 175,
                                    ),
                                    Text(getTimeString(audioDuration),
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8))),
                                  ],
                                ),
                                //SizedBox(height: 100),
                                Stack(
                                  clipBehavior: Clip.none,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    // padding: EdgeInsets.all(16),
                    height: 500,
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                                radius: 35,
                                child: IconButton(
                                  icon: Icon(
                                    audioPlayerState == PlayerState.playing
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                  iconSize: 50,
                                  onPressed: () {
                                    audioPlayerState == PlayerState.playing
                                        ? pauseMusic()
                                        : playMusic();
                                  },
                                )),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     final snackBar = SnackBar(
                            //       content: const Text('Yay! A SnackBar!'),
                            //       action: SnackBarAction(
                            //         label: 'Undo',
                            //         onPressed: () {
                            //           // Some code to undo the change.
                            //         },
                            //       ),
                            //     );

                            //     // Find the ScaffoldMessenger in the widget tree
                            //     // and use it to show a SnackBar.
                            //     ScaffoldMessenger.of(context)
                            //         .showSnackBar(snackBar);
                            //   },
                            //   child: const Text('Show SnackBar'),
                            // ),
                          )
                        ]),
                        Text(
                          "bro",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                        SizedBox(height: 32),
                        // Text(
                        //   "You might also like",
                        //   style: Theme.of(context).textTheme.headline6,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 16),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       AlbumCard(
                        //         size: cardSize,
                        //         label: "Get Turnt",
                        //         image: AssetImage("assets/album3.jpg"),
                        //       ),
                        //       AlbumCard(
                        //         size: cardSize,
                        //         label: "Get Turnt",
                        //         image: AssetImage("assets/album5.jpg"),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // App bar

          Positioned(
              child: Container(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              color: showTopBar
                  ? Color(0xFFC61855).withOpacity(1)
                  : Color(0xFFC61855).withOpacity(0),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 38,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 250),
                        opacity: showTopBar ? 1 : 0,
                        child: Text(
                          "Ophelia",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  playMusic() async {
    await audioPlayer.play(AssetSource('music/classical/FurElise.mp3'));
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  void seektoSec(int sec) {
    Duration newPosition = Duration(seconds: sec);
    audioPlayer.seek(newPosition);
  }
}

String getTimeString(int miliseconds) {
  String minutes =
      '${(miliseconds / 60000).floor() < 10 ? 0 : ''}${(miliseconds / 60000).floor()}';
  String seconds =
      '${(miliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(miliseconds / 1000).floor() % 60}';
  return '$minutes:$seconds';
}
