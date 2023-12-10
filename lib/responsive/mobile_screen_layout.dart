import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/providers/user_providers.dart';
import 'package:insta/utils/color.dart';
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
    int _page = 0;
    return Scaffold(
      body: Center(
        child: Text("Mobile user:${user.username}"),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
