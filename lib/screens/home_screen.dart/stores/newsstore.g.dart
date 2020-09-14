// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStoreBase, Store {
  final _$newsListAtom = Atom(name: '_NewsStoreBase.newsList');

  @override
  ObservableFuture<List<NewsItem>> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(ObservableFuture<List<NewsItem>> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  final _$_NewsStoreBaseActionController =
      ActionController(name: '_NewsStoreBase');

  @override
  Future<void> fetchNewsList() {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.fetchNewsList');
    try {
      return super.fetchNewsList();
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newsList: ${newsList}
    ''';
  }
}
