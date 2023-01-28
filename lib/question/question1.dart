import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:Calmify/question/question2.dart';

class QuestionOne extends StatefulWidget {
  const QuestionOne({super.key});

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('How are you feeling right now?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  )),
              SizedBox(
                height: 40,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: getColor(Colors.white, Colors.blue),
                          backgroundColor: getColor(
                              Color.fromARGB(255, 15, 95, 233), Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuestionTwo(value: value),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Happy   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/verygood.png',
                              ),
                              height: 30,
                              width: 30,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: getColor(Colors.white, Colors.blue),
                          backgroundColor: getColor(
                              Color.fromARGB(255, 15, 95, 233), Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuestionTwo(value: value++),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Slightly Happy   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/good.png',
                              ),
                              height: 30,
                              width: 30,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: getColor(Colors.white, Colors.blue),
                          backgroundColor: getColor(
                              Color.fromARGB(255, 15, 95, 233), Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuestionTwo(value: value + 2),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Neutral   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/average.png',
                              ),
                              height: 30,
                              width: 30,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: getColor(Colors.white, Colors.blue),
                          backgroundColor: getColor(
                              Color.fromARGB(255, 15, 95, 233), Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuestionTwo(value: value + 3),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Slightly sad   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/sad.png',
                              ),
                              height: 30,
                              width: 30,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: getColor(Colors.white, Colors.blue),
                          backgroundColor: getColor(
                              Color.fromARGB(255, 15, 95, 233), Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QuestionTwo(value: value + 4),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Sad   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/verysad.png',
                              ),
                              height: 30,
                              width: 30,
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }
}
