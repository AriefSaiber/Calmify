// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/Menus/Yoga.dart';
import 'package:Calmify/widgets/userjson.dart';
import '../Menus/Meditation.dart';
import '../Menus/Music.dart';
import '../Menus/Chat.dart';
import '../Menus/Profile.dart';
import 'package:audioplayers/audioplayers.dart';
import '../pages/MediGuide.dart';
import '../widgets/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationsService notificationsService = NotificationsService();
  @override
  void initState() {
    super.initState();
    notificationsService.initialiseNotifications();
    notificationsService.scheduleNotification(
        "Meditation reminder", "Have you done your meditation today?");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: Image.asset(
              'assets/Calmify.png',
              height: 140,
              width: 130,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),

          //meditation
          resizeToAvoidBottomInset: false,
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
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('What would you like to do today?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 20,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MediGuide(
                                    showHomePage: () {},
                                  )),
                        );
                      },
                      child: (Image(
                        image: AssetImage('assets/Meditation.png'),
                        height: 300,
                        width: 400,
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YogaPage()),
                        );
                      },
                      child: (Image(
                        image: AssetImage('assets/YogaMan.png'),
                        height: 280,
                        width: 280,
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MusicPage(
                              showHomePage: () {},
                            ),
                          ),
                        );
                      },
                      child: (Image(
                        image: AssetImage('assets/Music.png'),
                        height: 320,
                        width: 320,
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveChat(
                                    showHomePage: () {},
                                  )),
                        );
                      },
                      child: (Image(
                        image: AssetImage('assets/contact.png'),
                        height: 250,
                        width: 250,
                      )),
                    ),
                  ],
                ),
              )))),
    );
  }
}
