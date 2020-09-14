import 'dart:async';

import 'package:boti_challenge/models/news_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NewsDetailScreen extends StatefulWidget {
  final NewsItem item;
  final int index;

  const NewsDetailScreen({Key key, @required this.item, @required this.index})
      : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  double _effectHeight = 0;
  double _opacityEffect = 0;

  @override
  void initState() {
    Timer(Duration(milliseconds: 10), () {
      setState(() {
        _effectHeight = 50;
        _opacityEffect = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    "https://source.unsplash.com/300x30${widget.index}/?nature,animals,people",
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withAlpha(100),
                          Colors.black,
                        ],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        stops: [0.7, 1.0],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: _effectHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _opacityEffect,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.item.user.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${DateFormat.yMMMMEEEEd('pt_BR').format(widget.item.message.createdAt)}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 35),
                            child: Row(
                              children: [
                                socialMediaIcon(icon: MdiIcons.instagram),
                                socialMediaIcon(icon: MdiIcons.facebook),
                                socialMediaIcon(icon: MdiIcons.twitter),
                                socialMediaIcon(icon: MdiIcons.pinterest),
                                socialMediaIcon(icon: MdiIcons.reddit),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                      child: Text(
                                    "165 curtidas",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Text(
                  widget.item.message.content,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialMediaIcon({IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Icon(
            icon,
            color: Colors.black,
            size: 15,
          ),
        ),
      ),
    );
  }
}
