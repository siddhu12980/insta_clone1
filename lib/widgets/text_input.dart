import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final bool isPass;
  final TextInputType textInputType;
  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      required this.hinttext,
      this.isPass = false,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hinttext,
        border: InputBorder,
        focusedBorder: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
      obscureText: isPass, //for password
    );
  }
}
