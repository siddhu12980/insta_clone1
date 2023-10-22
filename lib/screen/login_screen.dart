import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta/utils/color.dart';
import 'package:insta/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: Colors.white,
              height: 62,
            ),
            const SizedBox(
              height: 40,
            ),

            const SizedBox(height: 60),

            TextFieldInput(
                textEditingController: _emailController,
                hinttext: "Enter your email",
                textInputType: TextInputType.emailAddress),

            const SizedBox(height: 25),

            TextFieldInput(
              textEditingController: _passwordController,
              hinttext: "Enter your password",
              textInputType: TextInputType.text,
              isPass: true,
            ),

            const SizedBox(height: 25),

            Container(
              child: Text("login"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                color: blueColor,
              ),
            ),
            const SizedBox(
              height: 14,
            ),

            Flexible(
              child: Container(),
              flex: 2,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Create New account"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Create New account"),
                ),
              ],
            )

            //login and signup
          ]),
        ),
      ),
    );
  }
}
