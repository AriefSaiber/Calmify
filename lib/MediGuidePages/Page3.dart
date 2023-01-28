import 'package:flutter/material.dart';
import 'package:Calmify/question/question1.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../Menus/Meditation.dart';

class Page3 extends StatefulWidget {
  Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue.withOpacity(0.7),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 150),
            Text(
              'Choose your desired option',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '(Slide to select)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SlideAction(
                  text: '      Suggested Meditation',
                  textStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                  onSubmit: () {
                    Future.delayed(
                        Duration(seconds: 1),
                        (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionOne()),
                            )));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SlideAction(
                  text: '     Manual option',
                  textStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                  onSubmit: () {
                    Future.delayed(
                        Duration(seconds: 1),
                        (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MeditationPage(
                                        showHomePage: () {},
                                      )),
                            )));
                  }),
            ),
          ],
        )));
  }
}
