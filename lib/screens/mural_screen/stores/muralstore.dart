import 'package:boti_challenge/screens/mural_screen/stores/poststore.dart';
import 'package:mobx/mobx.dart';
part 'muralstore.g.dart';

class MuralStore = _MuralStoreBase with _$MuralStore;

abstract class _MuralStoreBase with Store {
  @observable
  String newPostText = "";

  @observable
  ObservableList<PostStore> postList = ObservableList<PostStore>();

  @action
  void changeNewPost(String value) => newPostText = value;

  @computed
  bool get isNewPostValid => newPostText.isNotEmpty;

  @action
  void addPost(PostStore newPost) => postList.add(newPost);

  @action
  void inserPost(PostStore newPost) => postList.insert(0, newPost);

  @action
  void removePost(PostStore deletedPost) => postList.remove(deletedPost);
}
