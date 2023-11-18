import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/responsive/mobile_screen_layout.dart';
import 'package:insta/responsive/responsive_layout_screen.dart';
import 'package:insta/responsive/web_screen_layout.dart';
import 'package:insta/screen/login_screen.dart';
import 'package:insta/utils/color.dart';
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

      home: StreamBuilder(
        stream: FirebaseAuth.instance
            .authStateChanges(), //idtokenchanges/user_changes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const Responsivelayout(
                mobilescreenlayout: mobilescreenlayout(),
                webscreenlayout: webscreenlayout(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.hasError}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          return const LoginScreen();
        },
      ),
    );
  }
}

//creating preastating user state
