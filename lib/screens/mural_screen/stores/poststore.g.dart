// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poststore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStoreBase, Store {
  final _$textAtom = Atom(name: '_PostStoreBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$likesAtom = Atom(name: '_PostStoreBase.likes');

  @override
  int get likes {
    _$likesAtom.reportRead();
    return super.likes;
  }

  @override
  set likes(int value) {
    _$likesAtom.reportWrite(value, super.likes, () {
      super.likes = value;
    });
  }

  final _$wasLikedAtom = Atom(name: '_PostStoreBase.wasLiked');

  @override
  bool get wasLiked {
    _$wasLikedAtom.reportRead();
    return super.wasLiked;
  }

  @override
  set wasLiked(bool value) {
    _$wasLikedAtom.reportWrite(value, super.wasLiked, () {
      super.wasLiked = value;
    });
  }

  final _$_PostStoreBaseActionController =
      ActionController(name: '_PostStoreBase');

  @override
  void likePost() {
    final _$actionInfo = _$_PostStoreBaseActionController.startAction(
        name: '_PostStoreBase.likePost');
    try {
      return super.likePost();
    } finally {
      _$_PostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
likes: ${likes},
wasLiked: ${wasLiked}
    ''';
  }
}
