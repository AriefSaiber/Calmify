import 'package:Calmify/auth/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/widgets/notification.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  void clearText() {
    _nameController.clear();
    _ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('My Profile'),
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
                child: SingleChildScrollView(
                  // physics: BouncingScrollPhysics(
                  //     parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('Your Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 20,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder<
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
                                  return Text(
                                      'email: ' + data['email'].toString(),
                                      style: TextStyle(fontSize: 18));
                                },
                              ),
                              StreamBuilder<
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
                                  return Text(
                                      'name: ' + data['name'].toString(),
                                      style: TextStyle(fontSize: 18));
                                },
                              ),
                              StreamBuilder<
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
                                  return Text('age: ' + data['age'].toString(),
                                      style: TextStyle(fontSize: 18));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Update your Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "enter correct name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      obscureText: false,
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'name',
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "enter correct email";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _ageController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'age',
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              final docUser = FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid);

                              docUser.update(({
                                'name': _nameController.text.trim(),
                                'age': _ageController.text.trim(),
                              }));
                              clearText();
                              final snackbar = SnackBar(
                                content: const Text('Updated profile'),
                              );
                            } else {
                              final snackbar = SnackBar(
                                content: const Text('Please insert details'),
                              );
                            }
                          },
                          child: Text(
                            'submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Get.to(MainPage());
                        },
                        color: Colors.blue,
                        child: Text(
                          'sign out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
