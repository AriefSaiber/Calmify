import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/widgets/userjson.dart';

class User {
  String uid;
  final String name;
  final int age;
  final String email;

  User({
    this.uid = '',
    required this.name,
    required this.age,
    required this.email,
  });
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'age': age,
        'email': email,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        uid: json['id'],
        name: json['name'],
        age: json['age'],
        email: json['email'],
      );
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String myName = '';
  //is userid exist
  Future getDoc() async {
    var a = await FirebaseFirestore.instance.collection('users').doc().get();
    if (a.exists) {
      print('Exists');
      return a;
    }
    if (!a.exists) {
      print('Not exists');
      return null;
    }
  }

  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  Future<User?> readUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('users').doc('');

    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    } else {
      print('User does not exist');
    }
  }

  Widget buildUser(User user) => Center(child: Text(user.name));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Dashboard'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      return Text('Dear ' + data['name'] + ',',
                          style: TextStyle(fontSize: 26));
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 350,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(Icons.format_quote_outlined),
                              Text(
                                '"The only impossible journey is the one you never begin"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '-Tony Robbins',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Text(
                      'Your Milestone',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                  "assets/circleBorder.png",
                                ),
                                width: 150,
                                height: 150),
                            Container(
                              child: StreamBuilder<
                                  DocumentSnapshot<Map<String, dynamic>>>(
                                stream: _usersStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text("Loading");
                                  }
                                  Map<String, dynamic> data = snapshot.data!
                                      .data()! as Map<String, dynamic>;
                                  return Text(data['meditate'].toString(),
                                      style: TextStyle(fontSize: 40));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Meditation',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text('Practiced',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                  "assets/circleBorder.png",
                                ),
                                width: 150,
                                height: 150),
                            Container(
                              child: StreamBuilder<
                                  DocumentSnapshot<Map<String, dynamic>>>(
                                stream: _usersStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text("Loading");
                                  }
                                  Map<String, dynamic> data = snapshot.data!
                                      .data()! as Map<String, dynamic>;
                                  return Text(data['yoga'].toString(),
                                      style: TextStyle(fontSize: 40));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Yoga',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text('Practiced',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
