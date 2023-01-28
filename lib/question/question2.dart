import 'package:flutter/material.dart';
import 'package:Calmify/Meditation/Focus.dart';
import 'package:Calmify/Meditation/Progressive.dart';
import 'package:Calmify/pages/home_page.dart';
import '../Meditation/Loving.dart';
import '../Meditation/Mindful.dart';

class QuestionTwo extends StatefulWidget {
  final int value;
  const QuestionTwo({super.key, required this.value});

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  @override
  Widget build(BuildContext context) {
    int value = widget.value;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('How are your circumstances?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  )),
              SizedBox(
                height: 40,
              ),
              Wrap(
                spacing: 20,
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
                          value = value;
                          if (value == 1 || value == 2 || value == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FocusPage(),
                            ));
                          } else if (value == 4 || value == 5) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LovingPage(),
                            ));
                          } else if (value == 6 || value == 7) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MindfulPage(),
                            ));
                          } else if (value == 8 || value == 9) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgressivePage(),
                            ));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Quiet   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/quiet.png',
                              ),
                              height: 40,
                              width: 40,
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
                          value = value + 1;
                          if (value == 1 || value == 2 || value == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FocusPage(),
                            ));
                          } else if (value == 4 || value == 5) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LovingPage(),
                            ));
                          } else if (value == 6 || value == 7) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MindfulPage(),
                            ));
                          } else if (value == 8 || value == 9) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgressivePage(),
                            ));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Slightly quiet   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/slightlyquiet.png',
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
                          value = value + 2;
                          if (value == 1 || value == 2 || value == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FocusPage(),
                            ));
                          } else if (value == 4 || value == 5) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LovingPage(),
                            ));
                          } else if (value == 6 || value == 7) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MindfulPage(),
                            ));
                          } else if (value == 8 || value == 9) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgressivePage(),
                            ));
                          }
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
                                'assets/emoji/neutral.png',
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
                          value = value + 3;
                          if (value == 1 || value == 2 || value == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FocusPage(),
                            ));
                          } else if (value == 4 || value == 5) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LovingPage(),
                            ));
                          } else if (value == 6 || value == 7) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MindfulPage(),
                            ));
                          } else if (value == 8 || value == 9) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgressivePage(),
                            ));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Slightly busy   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/slightbusy.png',
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
                          value = value + 4;
                          if (value == 1 || value == 2 || value == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FocusPage(),
                            ));
                          } else if (value == 4 || value == 5) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LovingPage(),
                            ));
                          } else if (value == 6 || value == 7) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MindfulPage(),
                            ));
                          } else if (value == 8 || value == 9) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgressivePage(),
                            ));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '    Busy   ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/emoji/busy.png',
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
