import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'Done.dart';

class HardPage4 extends StatefulWidget {
  const HardPage4({super.key});

  @override
  State<HardPage4> createState() => _HardPage4State();
}

class _HardPage4State extends State<HardPage4> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  final VideoPlayerController _controller = VideoPlayerController.network(
      'https://thumbs.gfycat.com/AgonizingSpecificAnkole-mobile.mp4');
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
        Get.to(() => const HardDone());
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
          Get.to(() => const HardDone());
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
                Text('Child’s Pose',
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
                            '1. Sit back on your heels with your knees together.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Text(
                            '2. Bend forward and walk your hands in front of you.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Text('3. Rest your forehead gently on the floor.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Text(
                            '4. Keep your arms extended in front of you or bring your arms alongside your body with your palms facing up.',
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
