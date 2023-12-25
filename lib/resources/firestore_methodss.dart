import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:insta/resources/storage_method.dart';

class Firestoremethodss {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
  ) async {
    String res = "Error";

    try{
      String photoUrl= StorageMethods().UploadImgToStorage('posts', file, isPost)
    }
  }
}
