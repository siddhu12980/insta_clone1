import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/resources/auth_methods.dart';
import 'package:insta/utils/color.dart';
import 'package:insta/utils/utlis.dart';
import 'package:insta/widgets/text_input.dart';
import 'package:insta/resources/auth_methods.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

// ignore: camel_case_types
class _signupScreenState extends State<signupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _biocontroller.dispose();
    _usernamecontroller.dispose();
  }

  void selectiamge() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                // ignore: deprecated_member_use
                color: Colors.white, //depreciated
                height: 62,
              ),
              const SizedBox(
                height: 40,
              ),

              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 65,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              'https://www.w3schools.com/w3images/avatar2.png'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectiamge,
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),

              const SizedBox(height: 60),

              TextFieldInput(
                  textEditingController: _usernamecontroller,
                  hinttext: "Enter your username",
                  textInputType: TextInputType.text),

              const SizedBox(height: 25),

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
              TextFieldInput(
                textEditingController: _biocontroller,
                hinttext: "Enter your bio",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 25),

              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signupuser(
                      email: _emailController.text,
                      username: _usernamecontroller.text,
                      password: _passwordController.text,
                      bio: _biocontroller.text,
                      file: _image!);
                  // ignore: avoid_print
                  print(res);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: blueColor,
                  ),
                  child: const Text("Signup"),
                ),
              ),
              const SizedBox(
                height: 14,
              ),

              Flexible(
                flex: 1,
                child: Container(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Already,Have an account?"),
                  ),
                  GestureDetector(
                    // ignore: avoid_print
                    onTap: () => print("new_account created"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        " Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )

              //login and signup
            ],
          ),
        ),
      ),
    );
  }
}
