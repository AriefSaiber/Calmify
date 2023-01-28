import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/Yoga/medium/page2.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MediumPage1 extends StatefulWidget {
  const MediumPage1({super.key});

  @override
  State<MediumPage1> createState() => _MediumPage1State();
}

class _MediumPage1State extends State<MediumPage1> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  final VideoPlayerController _controller = VideoPlayerController.network(
      'https://thumbs.gfycat.com/SnivelingVerifiableGharial-mobile.mp4');
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  Widget content() {
    return Center(
      child: Container(
        width: 350,
        height: 350,
        child: Chewie(controller: chewieController!),
      ),
    );
  }

  Widget buildButton() {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 35,
            child: IconButton(
              color: Colors.white,
              icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
              iconSize: 50,
              onPressed: () {
                if (isRunning) {
                  stopTimer(reset: false);
                } else {
                  startTimer();
                }
              },
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 35,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.play_arrow),
              iconSize: 50,
              onPressed: () {
                startTimer();
              },
            ),
          );
  }

  Widget buildTime() {
    return Text('$seconds',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 50,
        ));
  }

  Widget buildTimer() => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: seconds / maxSeconds,
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 8,
              backgroundColor: Colors.greenAccent,
            ),
            Center(
              child: buildTime(),
            ),
          ],
        ),
      );

  Widget buildReset() {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 35,
      child: IconButton(
        color: Colors.white,
        icon: Icon(Icons.replay),
        iconSize: 50,
        onPressed: () {
          resetTimer();
        },
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        timer?.cancel();
        Get.to(() => const MediumPage2());
      }
    });
  }

  void resetTimer() => setState(() {
        seconds = maxSeconds;
      });

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() => timer?.cancel());
  }

  Widget nextButton() {
    return GestureDetector(
        onTap: () {
          stopTimer();
          Get.to(() => const MediumPage2());
        },
        child: (Text('Skip session',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 18,
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue,
          Color.fromARGB(255, 174, 219, 255),
        ],
      )),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text('Cat-Cow',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20),
                content(),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Align(alignment: Alignment.center, child: buildTimer()),
                    Positioned(top: 15, right: 20, child: buildButton()),
                    Positioned(top: 15, left: 20, child: buildReset()),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.withOpacity(0.65)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                            '1. Place your wrists underneath your shoulders and your knees underneath your hips.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Text(
                            '2. Balance your weight evenly between all four points.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Text(
                            '3. Inhale as you look up and let your stomach drop down toward the mat.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        Text(
                            '4. Exhale as you tuck your chin into your chest, draw your navel toward your spine, and arch your spine toward the ceiling.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        Text(
                            '4. Maintain awareness of your body as you do this movement.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                nextButton(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
