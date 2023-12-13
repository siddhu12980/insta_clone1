import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/utils/utlis.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Uint8List? _image;

  void selectiamge() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
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
            bottom: -20,
            left: 80,
            child: IconButton(
              onPressed: selectiamge,
              icon: const Icon(Icons.add_a_photo),
            ),
          )
        ],
      ),
    );
  }
}
