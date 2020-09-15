import 'package:boti_challenge/models/user.dart';

class Post {
  User user;
  DateTime date;
  String text;
  String imageUrl;
  int likes;
  int shares;
  int comments;
  String likedBy;

  Post({
    this.user,
    this.date,
    this.text,
    this.imageUrl,
    this.likes,
    this.shares,
    this.comments,
    this.likedBy,
  });
}
