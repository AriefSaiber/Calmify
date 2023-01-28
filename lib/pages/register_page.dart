// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/utils.dart';

class User {
  String uid;
  final String name;
  final int age;
  final String email;
  final int meditate;
  final int yoga;

  User({
    this.uid = '',
    required this.name,
    required this.age,
    required this.email,
    required this.meditate,
    required this.yoga,
  });
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'age': age,
        'email': email,
        'meditate': meditate,
        'yoga': yoga,
      };
}

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Password strength
  bool isHidden = true;
  final _formKey = GlobalKey<FormState>();
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (_password.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (_password.length < 8) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  int _meditate = 0;
  int _yoga = 0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => Center(
              child: CircularProgressIndicator(),
            )));

    //create user
    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        //add user details
        addUserDetails(
          _nameController.text.trim(),
          int.parse(_ageController.text.trim()),
          _emailController.text.trim(),
          _meditate,
          _yoga,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future addUserDetails(
      String name, int age, String email, int meditate, int yoga) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final docUser = FirebaseFirestore.instance.collection('users').doc(userId);

    final user = User(
      uid: docUser.id,
      name: name,
      age: age,
      email: email,
      meditate: meditate = 0,
      yoga: yoga = 0,
    );
    final json = user.toJson();

    //create document and write data to firebase
    await docUser.set(json);
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //hello
                    Text('Welcome to the family!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Abalone',
                          fontSize: 33,
                        )),
                    SizedBox(height: 5),

                    //2nd para
                    // ignore: prefer_const_constructors
                    Text('Insert your details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        )),
                    SizedBox(height: 55),

                    //name
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
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name',
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //age
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
                              controller: _ageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Age',
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

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
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? "Enter a valid email"
                                    : null,
                          ),
                        ),
                      ),
                    ),

                    //password
                    // SizedBox(height: 10),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey[200],
                    //       border: Border.all(color: Colors.lightBlue),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 20.0),
                    //       child: TextField(
                    //           obscureText: true,
                    //           controller: _passwordController,
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: 'Password',
                    //           )),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10),

                    //test try pass
                    Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: isHidden,
                              onChanged: (value) {
                                _formKey.currentState!.validate();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                } else {
                                  //call function to check password
                                  bool result = validatePassword(value);
                                  if (result) {
                                    // create account event
                                    return null;
                                  } else {
                                    return "Capital, small letter, Number & Special characters are required";
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 4, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: isHidden
                                        ? (Icon(Icons.visibility_off))
                                        : Icon(Icons.visibility),
                                    onPressed: togglePasswordVisibility,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Password"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: LinearProgressIndicator(
                              value: password_strength,
                              backgroundColor:
                                  Color.fromARGB(255, 185, 185, 185),
                              minHeight: 5,
                              color: password_strength <= 1 / 4
                                  ? Colors.red
                                  : password_strength == 2 / 4
                                      ? Colors.yellow
                                      : password_strength == 3 / 4
                                          ? Colors.blue
                                          : Colors.green,
                            ),
                          ),
                        ])),

                    //confirm password
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
                              controller: _confirmpasswordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    //sign up
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up',
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

                    //sign up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Have an account?'),
                        GestureDetector(
                            onTap: widget.showLoginPage,
                            child: (Text(' Sign in',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ))))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ]),
            ),
          ),
        ),
      ),
    ));
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
