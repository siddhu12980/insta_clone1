import 'package:flutter/material.dart';
import 'package:insta/providers/user_providers.dart';
import 'package:insta/utils/dimension.dart';
import 'package:provider/provider.dart';

class Responsivelayout extends StatefulWidget {
  final Widget webscreenlayout;
  final Widget mobilescreenlayout;

  const Responsivelayout(
      {super.key,
      required this.webscreenlayout,
      required this.mobilescreenlayout});

  @override
  State<Responsivelayout> createState() => _ResponsivelayoutState();
}

class _ResponsivelayoutState extends State<Responsivelayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    // Access the UserProvider using Provider.of
    UserProvider userprovider = Provider.of(context, listen: false);
    await userprovider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webscreenlayout_size) {
        //web screen
        return widget.webscreenlayout;
      }
      return widget.mobilescreenlayout;
      //mobile screen
    });
  }
}
