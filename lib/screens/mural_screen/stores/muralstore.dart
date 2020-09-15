import 'package:boti_challenge/models/post.dart';
import 'package:boti_challenge/screens/mural_screen/stores/poststore.dart';
import 'package:mobx/mobx.dart';
part 'muralstore.g.dart';

class MuralStore = _MuralStoreBase with _$MuralStore;

abstract class _MuralStoreBase with Store {
  @observable
  ObservableList<PostStore> postList = ObservableList<PostStore>();

  @action
  void addPost(PostStore newPost) => postList.add(newPost);

  @action
  void inserPost(PostStore newPost) => postList.insert(0, newPost);
}
