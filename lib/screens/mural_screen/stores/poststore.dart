import 'package:mobx/mobx.dart';
part 'poststore.g.dart';

class PostStore = _PostStoreBase with _$PostStore;

abstract class _PostStoreBase with Store {
  String userName;
  String profilePicture;
  DateTime date;
  String imageUrl;
  int shares;
  int comments;
  String likedBy;

  _PostStoreBase({
    this.profilePicture,
    this.userName,
    this.date,
    this.text,
    this.imageUrl,
    this.likes,
    this.shares,
    this.comments,
    this.likedBy,
  });

  @observable
  String text = "";

  @observable
  int likes = 0;

  @observable
  bool wasLiked = false;

  @action
  void likePost() {
    if (wasLiked) {
      likes--;
    } else {
      likes++;
    }
    wasLiked = !wasLiked;
  }
}
