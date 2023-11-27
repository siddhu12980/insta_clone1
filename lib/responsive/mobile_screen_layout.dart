import 'package:flutter/material.dart';

class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

// ignore: camel_case_types
class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("this is mobile"),
      ),
    );
  }
}
