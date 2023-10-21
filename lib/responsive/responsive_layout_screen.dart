import 'package:flutter/material.dart';
import 'package:insta/utils/dimension.dart';

class Responsivelayout extends StatelessWidget {
  final Widget webscreenlayout;
  final Widget mobilescreenlayout;

  const Responsivelayout(
      {super.key,
      required this.webscreenlayout,
      required this.mobilescreenlayout});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webscreenlayout_size) {
        //web screen
        return webscreenlayout;
      }
      return mobilescreenlayout;
      //mobile screen
    });
  }
}
