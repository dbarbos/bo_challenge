import 'package:mobx/mobx.dart';
part 'poststore.g.dart';

class PostStore = _PostStoreBase with _$PostStore;

abstract class _PostStoreBase with Store {
  String userName;
  String profilePicture;
  DateTime date;
  String imageUrl;

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
  int shares = 0;

  @observable
  int comments = 0;

  @observable
  bool wasLiked = false;

  @observable
  bool wasShared = false;

  @observable
  bool wasCommented = false;

  @action
  void likePost() {
    if (wasLiked) {
      likes--;
    } else {
      likes++;
    }
    wasLiked = !wasLiked;
  }

  @action
  void sharePost() {
    if (wasShared) {
      shares--;
    } else {
      shares++;
    }
    wasShared = !wasShared;
  }

  @action
  void commentPost() {
    if (wasCommented) {
      comments--;
    } else {
      comments++;
    }
    wasCommented = !wasCommented;
  }
}
