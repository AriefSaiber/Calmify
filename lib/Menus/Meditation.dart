import 'package:flutter/material.dart';
import 'package:Calmify/Meditation/Loving.dart';
import 'package:Calmify/Meditation/Focus.dart';
import 'package:Calmify/Meditation/Mindful.dart';
import 'package:Calmify/Meditation/Progressive.dart';
import 'package:Calmify/pages/NavBar.dart';
import 'package:Calmify/pages/home_page.dart';

class MeditationPage extends StatefulWidget {
  final VoidCallback showHomePage;
  const MeditationPage({
    Key? key,
    required this.showHomePage,
  }) : super(key: key);

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
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
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: Text(
              'Meditation Page',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavBar()),
                );
              },
              child: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Container(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Color.fromARGB(255, 174, 219, 255),
                  // Color.fromARGB(255, 30, 43, 88),
                  // Color.fromARGB(255, 97, 76, 191),
                ],
              )),
              child: Center(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    Container(
                      // height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                                3.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FocusPage()),
                          );
                        },
                        child: (Image(
                          image: AssetImage('assets/focus.png'),
                          height: 180,
                          width: 500,
                        ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LovingPage()),
                          );
                        },
                        child: (Image(
                          image: AssetImage('assets/love.png'),
                          height: 180,
                          width: 500,
                        ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MindfulPage()),
                          );
                        },
                        child: (Image(
                          image: AssetImage('assets/mindful.png'),
                          height: 180,
                          width: 500,
                        ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgressivePage()),
                          );
                        },
                        child: (Image(
                          image: AssetImage('assets/progressive.png'),
                          height: 180,
                          width: 500,
                        ))),
                    SizedBox(height: 60),
                  ],
                ),
              )),
            ),
          )),
        ),
      ]),
    );
  }
}
