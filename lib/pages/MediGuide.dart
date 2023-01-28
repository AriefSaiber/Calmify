import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:Calmify/MediGuidePages/Page1.dart';
import 'package:Calmify/MediGuidePages/Page2.dart';
import 'package:Calmify/MediGuidePages/Page3.dart';

class MediGuide extends StatefulWidget {
  final VoidCallback showHomePage;
  const MediGuide({
    Key? key,
    required this.showHomePage,
  }) : super(key: key);
  @override
  State<MediGuide> createState() => _MediGuideState();
}

class _MediGuideState extends State<MediGuide> {
  PageController _controller = PageController();

  //if we on last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                onLastPage
                    ? Text("dataasa",
                        style: TextStyle(color: Colors.blue.withOpacity(0)))
                    : Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(2);
                          },
                          child: Text('skip',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              )),
                        ),
                      ),

                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(1);
                            duration:
                            Duration(milliseconds: 500);
                          },
                          child: Text('back',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              )),
                        ),
                      )
                    //next or done
                    : Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text('next',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              )),
                        ),
                      ),
              ],
            )),
      ],
    ));
  }
}
