import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue.withOpacity(0.7),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 130),
            Text(
              'Welcome to the Meditation Chamber!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            Image(
                height: 300,
                width: 300,
                image: AssetImage('assets/Tutorial.png'))
          ],
        )));
  }
}
