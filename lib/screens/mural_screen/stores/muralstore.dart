import 'package:boti_challenge/models/post.dart';
import 'package:mobx/mobx.dart';
part 'muralstore.g.dart';

class MuralStore = _MuralStoreBase with _$MuralStore;

abstract class _MuralStoreBase with Store {
  @observable
  ObservableList<Post> postList = ObservableList<Post>();

  @action
  void addPost(Post newPost) => postList.add(newPost);
}
