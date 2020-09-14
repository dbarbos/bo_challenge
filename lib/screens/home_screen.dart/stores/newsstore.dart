import 'dart:convert';

import 'package:boti_challenge/models/news_item.dart';
import 'package:mobx/mobx.dart';
import "package:http/http.dart" as http;

part 'newsstore.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  @observable
  ObservableFuture<List<NewsItem>> newsList;

  @action
  Future<void> fetchNewsList() =>
      newsList = ObservableFuture<List<NewsItem>>(http
          .get("https://gb-mobile-app-teste.s3.amazonaws.com/data.json")
          .then((httpResponse) =>
              jsonDecode(utf8.decode(httpResponse.bodyBytes))['news']
                  .map<NewsItem>((news) => NewsItem.fromMap(news))
                  .toList())).catchError((err) => print("erro: $err"));
}
