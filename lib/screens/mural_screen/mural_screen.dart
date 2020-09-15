import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:boti_challenge/screens/mural_screen/stores/muralstore.dart';
import 'package:boti_challenge/screens/mural_screen/stores/poststore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MuralScreen extends StatefulWidget {
  @override
  _MuralScreenState createState() => _MuralScreenState();
}

class _MuralScreenState extends State<MuralScreen> {
  MuralStore muralStore = MuralStore();

  @override
  void initState() {
    initializeDateFormatting("pt_BR");
    super.initState();

    muralStore.addPost(
      PostStore(
          userName: "Trinity Moss",
          profilePicture: "assets/avatars/TrinityMoss.png",
          date: DateTime.now(),
          likedBy: "Mr. Thomas Neo",
          likes: 8,
          shares: 12,
          comments: 43,
          text:
              "Gente do céu! Esse app novo está maravilhosoooo! Todo mundo em Zion curtiu demais o design e disseram que gostaram muito do novo colega, o Diler!"),
    );

    muralStore.addPost(
      PostStore(
          userName: "Paulo Bertoldi",
          profilePicture: "assets/avatars/PauloBertoldi.png",
          date: DateTime.now().subtract(Duration(minutes: 45)),
          likedBy: "Alice Carvalho",
          likes: 2,
          shares: 0,
          comments: 3,
          text:
              "Quem aí já conseguiu terminar o treinamento de segurança? Aquela questão da escada de incêndio eu achei bem difícil! \n#segurança #treinamente #seidenada"),
    );

    muralStore.addPost(
      PostStore(
        userName: "Alessandra Oliveira",
        profilePicture: "assets/avatars/AlessandraOliveira.png",
        date: DateTime.now().subtract(Duration(minutes: 90)),
        likedBy: "Paulo Bertoldi",
        likes: 55,
        shares: 20,
        comments: 23,
        text:
            "Achei um gatinho perdido perto do refeitório e estou organizando uma vaquinha para comprarmos leite. Quem quiser participar me manda mensagem plz!",
        imageUrl: "assets/images/gatinho.jpg",
      ),
    );

    muralStore.addPost(
      PostStore(
        userName: "Letícia Santos",
        profilePicture: "assets/avatars/LetíciaSantos.png",
        date: DateTime.now().subtract(Duration(minutes: 153)),
        likedBy: "Ilgner Ilgnei",
        likes: 6,
        shares: 1,
        comments: 0,
        text:
            "Eu queria dizer que a nova fragrância do projeto Pangolin está causando espirros esporáricos. Não deixem de colocar a mão na frente do rosto quando forem espirrar. \n#pangolin #cheiros",
      ),
    );

    muralStore.addPost(
      PostStore(
        userName: "Kimiko Ohi",
        profilePicture: "assets/avatars/KimikoOhi.png",
        date: DateTime.now().subtract(Duration(minutes: 265)),
        likedBy: "Antônio Boticarlos",
        likes: 7,
        shares: 32,
        comments: 15,
        text: "Bom dia!\n#dialindo #amooboti #hashtag #curitibalinda",
        imageUrl: "assets/images/curitibalinda.jpg",
      ),
    );

    muralStore.addPost(
      PostStore(
        userName: "Rogério Santana",
        profilePicture: "assets/avatars/RogérioSantana.png",
        date: DateTime.now().subtract(Duration(hours: 26)),
        likedBy: "Kimiko Ohi",
        likes: 65,
        shares: 12,
        comments: 3,
        text:
            "Pense como um boleto. Um boleto sempre vence.\n#frasesinspiradoras #guru #boti #tiosanta",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mural",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(MdiIcons.feather),
        onPressed: () {
          Alert(
              context: context,
              style: AlertStyle(
                titleStyle: TextStyle(
                  fontFamily:
                      Theme.of(context).primaryTextTheme.bodyText1.fontFamily,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              title: "Digite abaixo para postar",
              content: TextField(
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "O que está acontecendo?",
                ),
                maxLength: 280,
                maxLengthEnforced: true,
                minLines: 1,
                maxLines: 5,
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    muralStore.inserPost(PostStore(
                        userName: "Ma Jake",
                        profilePicture: "assets/avatars/avatar.jpg",
                        date: DateTime.now(),
                        text: "texto",
                        likes: 0,
                        shares: 0,
                        comments: 0,
                        likedBy: "ninguém"));
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "POSTAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]).show();
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          width: double.infinity,
          height: 300,
          child: Observer(builder: (_) {
            return ListView.builder(
                itemCount: muralStore.postList.length,
                itemBuilder: (BuildContext context, int index) {
                  return postCard(muralStore.postList[index]);
                });
          }),
        ),
      ),
    );
  }

  Widget postCard(PostStore post) {
    var postAge = DateTime.now().difference(post.date);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      MdiIcons.heart,
                      color: Colors.grey,
                      size: 15,
                    )),
              ),
              Container(
                width: 80,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 25, bottom: 25),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(post.profilePicture),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      "${post.likedBy} e outros ${post.likes} curtiram",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Row(
                      children: [
                        Text(
                          "${post.userName}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            postAge.inMinutes > 60
                                ? postAge.inHours > 24
                                    ? "${postAge.inDays} d"
                                    : "${postAge.inHours} h"
                                : "${postAge.inMinutes} m",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${post.text}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  post.imageUrl == null
                      ? Container()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            post.imageUrl,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width / 2.5,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        socialCounter(
                            MdiIcons.chatOutline, post.comments.toString()),
                        socialCounter(MdiIcons.shareVariantOutline,
                            post.shares.toString()),
                        Observer(builder: (_) {
                          return GestureDetector(
                            onTap: post.likePost,
                            child: socialCounter(
                              post.wasLiked
                                  ? MdiIcons.heart
                                  : MdiIcons.heartOutline,
                              post.likes.toString(),
                              color: post.wasLiked ? Colors.red : Colors.grey,
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget socialCounter(IconData icon, String value,
      {Color color = Colors.grey}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: color,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
