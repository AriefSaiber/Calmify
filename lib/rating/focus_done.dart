import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FocusDone extends StatefulWidget {
  const FocusDone({super.key});

  @override
  State<FocusDone> createState() => _FocusDoneState();
}

class _FocusDoneState extends State<FocusDone> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future grabID({required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
}
