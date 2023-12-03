import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

// ignore: camel_case_types
class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getusername();
  }

  void getusername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    print(snap.data());

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(" user:$username"),
      ),
    );
  }
}
