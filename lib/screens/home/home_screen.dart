import 'package:boti_challenge/models/news_item.dart';
import 'package:boti_challenge/screens/news_detail/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'stores/newsstore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsStore newsStore = NewsStore();

  @override
  void initState() {
    initializeDateFormatting("pt_BR");
    super.initState();

    newsStore.fetchNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          width: double.infinity,
          height: 300,
          child: Observer(builder: (_) {
            if (newsStore.newsList.status == FutureStatus.fulfilled) {
              var newsList = newsStore.newsList.value.reversed.toList();
              return RefreshIndicator(
                color: Theme.of(context).primaryColor,
                onRefresh: newsStore.fetchNewsList,
                child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return newsCard(newsList[index], index);
                    }),
              );
            }
            return Center(
              child: Container(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget newsCard(NewsItem item, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => NewsDetailScreen(
                  item: item,
                  index: index,
                )));
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://source.unsplash.com/300x30$index/?nature,animals,people",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.black.withAlpha(0), Colors.black],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "${DateFormat.MMMEd('pt_BR').add_jm().format(item.message.createdAt)}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "${item.message.content}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "por ${item.user.name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
