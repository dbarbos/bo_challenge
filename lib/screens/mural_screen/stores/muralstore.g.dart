// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muralstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MuralStore on _MuralStoreBase, Store {
  Computed<bool> _$isNewPostValidComputed;

  @override
  bool get isNewPostValid =>
      (_$isNewPostValidComputed ??= Computed<bool>(() => super.isNewPostValid,
              name: '_MuralStoreBase.isNewPostValid'))
          .value;

  final _$newPostTextAtom = Atom(name: '_MuralStoreBase.newPostText');

  @override
  String get newPostText {
    _$newPostTextAtom.reportRead();
    return super.newPostText;
  }

  @override
  set newPostText(String value) {
    _$newPostTextAtom.reportWrite(value, super.newPostText, () {
      super.newPostText = value;
    });
  }

  final _$postListAtom = Atom(name: '_MuralStoreBase.postList');

  @override
  ObservableList<PostStore> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(ObservableList<PostStore> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$_MuralStoreBaseActionController =
      ActionController(name: '_MuralStoreBase');

  @override
  void changeNewPost(String value) {
    final _$actionInfo = _$_MuralStoreBaseActionController.startAction(
        name: '_MuralStoreBase.changeNewPost');
    try {
      return super.changeNewPost(value);
    } finally {
      _$_MuralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPost(PostStore newPost) {
    final _$actionInfo = _$_MuralStoreBaseActionController.startAction(
        name: '_MuralStoreBase.addPost');
    try {
      return super.addPost(newPost);
    } finally {
      _$_MuralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void inserPost(PostStore newPost) {
    final _$actionInfo = _$_MuralStoreBaseActionController.startAction(
        name: '_MuralStoreBase.inserPost');
    try {
      return super.inserPost(newPost);
    } finally {
      _$_MuralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePost(PostStore deletedPost) {
    final _$actionInfo = _$_MuralStoreBaseActionController.startAction(
        name: '_MuralStoreBase.removePost');
    try {
      return super.removePost(deletedPost);
    } finally {
      _$_MuralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newPostText: ${newPostText},
postList: ${postList},
isNewPostValid: ${isNewPostValid}
    ''';
  }
}
