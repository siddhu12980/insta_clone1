import 'dart:typed_data';
import '';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/utils/color.dart';
import 'package:insta/utils/utlis.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  Uint8List? _image;

  void selectiamge() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create a Post"),
            children: [
              SimpleDialogOption(
                child: const Text("Take a Photo"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickimage(
                    ImageSource.camera,
                  );

                  setState(() {
                    _image = file;
                  });
                },
              ),
              SimpleDialogOption(
                child: const Text("Choose a Photo"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickimage(
                    ImageSource.gallery,
                  );

                  setState(() {
                    _image = file;
                  });
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: Icon(Icons.file_upload_outlined),
    //     onPressed: () {
    //       print("Pressed");
    //     },
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => {},
        ),
        title: Text("Post to"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => {},
            child: const Text(
              "Post",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Caption goes here",
                    border: InputBorder.none,
                  ),
                  maxLines: 4,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg'),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 65,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : IconButton(
                      onPressed: selectiamge,
                      icon: const Icon(Icons.upload_file_outlined),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
