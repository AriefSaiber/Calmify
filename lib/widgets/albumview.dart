import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/widgets/album_card.dart';
import 'package:audioplayers/audioplayers.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider image;
  final int counter;

  AlbumView({Key? key, required this.image, required this.counter})
      : super(key: key);
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
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
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
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
                                  if (widget.counter == 1) ...[
                                    Text(
                                      'Beethoven - Fur Elise',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 2) ...[
                                    Text(
                                      'Beethoven - Moonlight Sonata',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 3) ...[
                                    Text(
                                      'Beethoven – Sonata No.17',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 4) ...[
                                    Text(
                                      'Tchaikovsky - Swan Lake Theme',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 5) ...[
                                    Text(
                                      'Make it real - wildson',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 6) ...[
                                    Text(
                                      'Still missing U - Katnip',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 7) ...[
                                    Text(
                                      'Better Place - Spring Gang',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 8) ...[
                                    Text(
                                      'This Love of Mine - L.M Styles',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 9) ...[
                                    Text(
                                      'Mishary bin Rashid Alafasy - Al-Maun',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 10) ...[
                                    Text(
                                      'Mishary bin Rashid Alafasy - Almulk',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 11) ...[
                                    Text(
                                      'Mishary bin Rashid Alafasy - Alfatihah',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                  if (widget.counter == 12) ...[
                                    Text(
                                      'Mishary bin Rashid Alafasy - Alkafirun',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 35),
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
                                              color: Colors.white
                                                  .withOpacity(0.8))),
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
                          // SizedBox(height: 32),
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
                          //         int counter = 0,
                          //         size: cardSize,
                          //         label: "Better Place",
                          //         image: AssetImage("assets/album7.jpg"),
                          //         counter: widget.counter = 7,
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
                              pauseMusic();
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
                            "Calmify",
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
      ),
    );
  }

  playMusic() async {
    switch (widget.counter) {
      case 1:
        await audioPlayer.play(AssetSource('music/classical/FurElise.mp3'));
        break;
      case 2:
        await audioPlayer.play(AssetSource('music/classical/Moonlight.mp3'));
        break;
      case 3:
        await audioPlayer.play(AssetSource('music/classical/Sonata17.mp3'));
        break;
      case 4:
        await audioPlayer.play(AssetSource('music/classical/SwanLake.mp3'));
        break;
      case 5:
        await audioPlayer.play(AssetSource('music/soul/Real.mp3'));
        break;
      case 6:
        await audioPlayer.play(AssetSource('music/soul/Missing.mp3'));
        break;
      case 7:
        await audioPlayer.play(AssetSource('music/soul/BetterPlace.mp3'));
        break;
      case 8:
        await audioPlayer.play(AssetSource('music/soul/LoveMine.mp3'));
        break;
      case 9:
        await audioPlayer.play(AssetSource('music/alquran/almaun.mp3'));
        break;
      case 10:
        await audioPlayer.play(AssetSource('music/alquran/almulk.mp3'));
        break;
      case 11:
        await audioPlayer.play(AssetSource('music/alquran/fatihah.mp3'));
        break;
      case 12:
        await audioPlayer.play(AssetSource('music/alquran/kafirun.mp3'));
        break;
      default:
    }
  }

  getTitle() async {
    switch (widget.counter) {
      case 1:
        return Text('data');
      // break;
      default:
    }
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
