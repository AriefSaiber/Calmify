import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crisp/crisp_view.dart';
import 'package:crisp/models/main.dart';
import 'package:crisp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Calmify/pages/NavBar.dart';
import 'package:Calmify/widgets/bedtime_view.dart';

class LiveChat extends StatefulWidget {
  final VoidCallback showHomePage;
  const LiveChat({
    Key? key,
    required this.showHomePage,
  }) : super(key: key);

  @override
  State<LiveChat> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  late CrispMain crispMain;

  @override
  void initState() {
    super.initState();

    crispMain = CrispMain(
      websiteId: '4a1e20bf-b3bc-43e5-8cfe-3b56deaf874d',
    );

    crispMain.register(
      user: CrispUser(
        email: "",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "Guest",
        // phone: "5511987654321",
      ),
    );

    crispMain.setSessionData({
      "order_id": "111",
      "app_version": "0.1.1",
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text(
            'Contact us',
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
        body: CrispView(
          crispMain: crispMain,
          clearCache: false,
        ),
      ),
    );
  }
}
