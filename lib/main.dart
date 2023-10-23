import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta/screen/signup_screen.dart';
import 'package:insta/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets build insta',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      //making mobile screen for mobile and web screen for web
      debugShowCheckedModeBanner: false,
      // home: Responsivelayout(
      //   mobilescreenlayout: mobilescreenlayout(),
      //   webscreenlayout: webscreenlayout(),
      // ),
      home: const signupScreen(),
    );
  }
}
