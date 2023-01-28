import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/pages/NavBar.dart';
import 'package:Calmify/pages/home_page.dart';
import 'package:get/get.dart';

class MediDone extends StatefulWidget {
  const MediDone({super.key});

  @override
  State<MediDone> createState() => _MediDoneState();
}

class _MediDoneState extends State<MediDone> {
  @override
  Widget build(BuildContext context) {
    final DocumentReference _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

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
            Text('Are you done with your meditation?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _usersStream.update({"meditate": FieldValue.increment(1)});
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavBar()),
                );
              },
              child: Text('Absolutely!',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: (Text('No, take me back!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 140, 248),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ))))
          ],
        ),
      ),
    ));
  }
}
