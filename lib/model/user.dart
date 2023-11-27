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
}
