import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:Calmify/pages/NavBar.dart';
import 'package:Calmify/pages/home_page.dart';
import 'package:Calmify/widgets/utils.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      // check if email is verified every second
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }

    @override
    void dispose() {
      timer?.cancel();
      super.dispose();
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    //if email is verified, cancel timer
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      //5 sec delay before user can hit the button again
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? NavBar()
      : Scaffold(
          appBar: AppBar(
            title: Text('Verify Email'),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 0, 140, 255),
                Color.fromARGB(255, 174, 219, 255),
              ],
            )),
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'A verification email has been sent to your email, please click on the link sent to proceed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                        ),
                        icon: Icon(Icons.email, size: 28),
                        onPressed:
                            canResendEmail ? sendVerificationEmail : null,
                        label: Text('Resend Email',
                            style: TextStyle(
                              fontSize: 20,
                            ))),
                    SizedBox(height: 8),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      child: Text('Cancel', style: TextStyle(fontSize: 20)),
                      onPressed: () => FirebaseAuth.instance.signOut(),
                    )
                  ],
                )),
          ));
}
