import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Calmify/auth/main_page.dart';
import 'package:Calmify/main.dart';
import 'package:Calmify/widgets/utils.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(),
      );
}
