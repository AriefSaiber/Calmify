import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/Yoga/easy.dart';

import '../Yoga/hard.dart';
import '../Yoga/medium.dart';
import '../pages/NavBar.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<YogaPage> createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text(
            'Yoga Page',
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
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Choose your favored difficulty',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: _usersStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }
                      Map<String, dynamic> data =
                          snapshot.data!.data()! as Map<String, dynamic>;
                      if (int.parse(data['age']) < 25) {
                        return Text(
                            'We recommend you to choose the HARD course based on you age',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ));
                      }
                      if (int.parse(data['age']) < 35) {
                        return Text(
                            'We recommend you to choose the MEDIUM course based on you age',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ));
                      } else {
                        return Text(
                            'We recommend you to choose the EASY course based on you age',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ));
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EasyPage()),
                    );
                  },
                  child: (Image(
                    image: AssetImage('assets/easy.png'),
                    height: 130,
                    width: 250,
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MediumPage()),
                    );
                  },
                  child: (Image(
                    image: AssetImage('assets/medium.png'),
                    height: 130,
                    width: 250,
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HardPage()),
                    );
                  },
                  child: (Image(
                    image: AssetImage('assets/hard.png'),
                    height: 130,
                    width: 250,
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
