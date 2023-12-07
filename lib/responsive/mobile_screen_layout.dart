import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/providers/user_providers.dart';
import 'package:provider/provider.dart';
import 'package:insta/model/user.dart' as model;

// ignore: camel_case_types
class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

// ignore: camel_case_types
class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  String username = "";

  void greet() {
    print("this is it");
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        body: Center(
          child: Text("Mobile user:${user.username}"),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            IconButton(
              onPressed: () => greet(),
              icon: const Icon(Icons.refresh),
            )
          ],
        ));
  }
}
