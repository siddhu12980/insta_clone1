import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupuser({
    required String email,
    required String username,
    required String password,
    required String bio,
    // required Uint8List file,
  }) async {
    String res = "Signup user error";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty) {
        //register the user

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // ignore: avoid_print
        print(cred.user!.uid);

        // String photourl = await StorageMethods()
        //     .UploadImgToStorage('profilepic', file, false);

//add user to database

        await _firestore.collection('users').doc(cred.user!.uid).set({
          //use .add() without .doc
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          // ignore: prefer_if_null_operators
          // 'photoUrl': photourl != null ? photourl : ' ',
        });
        res = "sucess";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
