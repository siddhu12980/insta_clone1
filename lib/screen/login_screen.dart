import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //icon
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              height: 62,
            ),
            const SizedBox(
              height: 40,
            ),
            // TextField(), //email
            // TextField(), //passwd
            //login and signup
          ]),
        ),
      ),
    );
  }
}
