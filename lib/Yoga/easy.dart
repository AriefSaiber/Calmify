import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/Menus/Yoga.dart';
import 'package:Calmify/Yoga/easy/page1.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class EasyPage extends StatefulWidget {
  const EasyPage({super.key});

  @override
  State<EasyPage> createState() => _EasyPageState();
}

class _EasyPageState extends State<EasyPage> {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Stand up and start the course when you are ready',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: AssetImage('assets/standman.png'),
                    height: 350,
                    width: 350,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => const EasyPage1(),
                            transition: Transition.rightToLeft);
                      },
                      child: Text(
                        'Start the course!',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: (Text('Take me back',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          )))),
                ],
              ),
            )));
  }
}
