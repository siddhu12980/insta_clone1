import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/model/user.dart';
import 'package:insta/providers/user_providers.dart';
import 'package:insta/utils/color.dart';
import 'package:insta/utils/utlis.dart';
import 'package:provider/provider.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  final TextEditingController _descriptionController = TextEditingController();

  Uint8List? _image;

  void selectiamge() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void postimage(
    String uid,
    String username,
    String profileimage,
  ) async {
    try {} catch (e) {}
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
              ),
              SimpleDialogOption(
                  child: const Text(" Cancel "),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _image == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.file_upload_outlined),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
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
                  onPressed: () => postimage(),
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photourl.toString()),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_image!),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
