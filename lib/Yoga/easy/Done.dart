import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/Menus/Yoga.dart';
import 'package:get/get.dart';

class EasyDone extends StatefulWidget {
  const EasyDone({super.key});

  @override
  State<EasyDone> createState() => _EasyDoneState();
}

class _EasyDoneState extends State<EasyDone> {
  @override
  void initState() {
    final DocumentReference _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _usersStream.update({"yoga": FieldValue.increment(1)});
    Timer(
        Duration(seconds: 5),
        () =>
            Get.to(() => const YogaPage(), transition: Transition.leftToRight));

    super.initState();
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Congratulations!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('You are done with your course!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    )),
                    SizedBox(
                  height: 5,
                ),
                Text('You will be redirected to Yoga Page shortly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ],
            ))));
  }
}
