// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/widgets/forgot_password.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../widgets/forgot_password.dart';
import '../widgets/forgot_password.dart';
import '../widgets/utils.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => Center(
              child: CircularProgressIndicator(),
            )));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
          Color.fromARGB(255, 0, 140, 255),
          Color.fromARGB(255, 174, 219, 255),
        ],
      )),
      child: SafeArea(
        child: Center(
          // ignore: prefer_const_literals_to_create_immutables
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //hello
              Image(
                image: AssetImage('assets/Calmify.png'),
                height: 100,
                width: 300,
              ),
              //2nd para
              Text('The app for perfecting your lifestyle',
                  style: TextStyle(
                    color: Colors.white,
                    //fontStyle: FontStyle.italic,
                    //fontWeight: FontWeight.w100,
                    fontSize: 19,
                  )),
              SizedBox(height: 20),

              //image
              Image(
                image: AssetImage('assets/login.png'),
                height: 300,
                width: 300,
              ),
              SizedBox(height: 20),

              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        )),
                  ),
                ),
              ),
              //password
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //sign in
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                ),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => ForgotPasswordPage())))),
                      child: (Text(' Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )))),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              //sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: (Text(' Sign up now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )))),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
