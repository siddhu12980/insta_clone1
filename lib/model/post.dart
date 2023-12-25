import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String description;
  final String uid;
  final String username;
  final String postuid;
  final String datepublished;
  final String posturl;
  final List profimage;
  final String likes;

  const User({
    required this.description,
    required this.uid,
    required this.username,
    required this.postuid,
    required this.datepublished,
    required this.posturl,
    required this.profimage,
    required this.likes,
  });

  Map<String, dynamic> tojson() => {
        'description': description,
        'uid': uid,
        'username': username,
        'postuid': postuid,
        'datepublished': datepublished,
        'posturl': posturl,
        'profimage': profimage,
        'likes': likes,
      };

  static User fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      postuid: snapshot['postuid'],
      datepublished: snapshot['datepublished'],
      posturl: snapshot['posturl'],
      profimage: snapshot['profimage'],
      likes: snapshot['likes'],
    );
  }
}
