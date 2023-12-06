import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String photourl;

  const User({
    required this.username,
    required this.bio,
    required this.email,
    required this.followers,
    required this.following,
    required this.photourl,
    required this.uid,
  });

  Map<String, dynamic> tojson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photourl': photourl,
      };

  static User fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot['username'],
        bio: snapshot['bio'],
        email: snapshot['email'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photourl: snapshot['photourl'],
        uid: snapshot['uid']);
  }
}
