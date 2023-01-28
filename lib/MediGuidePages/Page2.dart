import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue.withOpacity(0.9),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 130),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Various of meditation sets for you to choose',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            // SizedBox(height: 10),
            Image(
                height: 240, width: 400, image: AssetImage('assets/List.png')),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'There are also suggested routine handpicked just for you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )));
  }
}
