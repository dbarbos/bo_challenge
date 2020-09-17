import 'package:boti_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                "assets/about/profile.JPG",
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 250,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "DILER BARBOSA JR",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        Text(
                          "dilermando.barbosa@gmail.com",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Este é um projeto de demonstração que tem por finalidade mostrar um aplicativo feito em Flutter usando MobX e com a apresentação de técnicas de design e engenharia.",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Veja abaixo dados relacionados a projetos e habilidades do desenvolvedor.",
                            style: TextStyle(color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: () {
                                  launchURL(
                                      "https://www.linkedin.com/in/dilermandob/");
                                },
                                elevation: 0,
                                highlightElevation: 0,
                                color: Colors.lightBlue[500],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Linkedin",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: () {
                                  launchURL("https://github.com/dbarbos");
                                },
                                elevation: 0,
                                highlightElevation: 0,
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Github",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "PROJETOS EM DESTAQUE",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            MdiIcons.fileDocumentMultiple,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.4,
                    reverse: false,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: projects(),
                  ),
                ),
                // SizedBox(
                //   height: 25,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Text(
                //         "STACK EXPERIENCE",
                //         textAlign: TextAlign.left,
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Expanded(
                //         child: Align(
                //           alignment: Alignment.centerRight,
                //           child: Icon(
                //             MdiIcons.robot,
                //             color: Colors.lightBlue[500],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // MediaQuery.removePadding(
                //   context: context,
                //   removeTop: true,
                //   child: GridView.count(
                //     physics: NeverScrollableScrollPhysics(),
                //     childAspectRatio: 1.2,
                //     reverse: false,
                //     shrinkWrap: true,
                //     crossAxisCount: 4,
                //     children: techStack(),
                //   ),
                // ),
                SizedBox(
                  height: 25,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Text(
                //         "SKILLS",
                //         textAlign: TextAlign.left,
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Expanded(
                //         child: Align(
                //           alignment: Alignment.centerRight,
                //           child: Icon(
                //             MdiIcons.fileDocumentMultiple,
                //             color: Colors.lightBlue[500],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       skillCard("Comunicação", 10),
                //       skillCard("Liderança", 12),
                //       skillCard("Multitarefa", 8),
                //       skillCard("Teamwork", 10),
                //       skillCard("Gerenciamento", 12),
                //       skillCard("Liderança", 12),
                //       skillCard("Inovação", 13),
                //       skillCard("Inglês", 13),
                //       skillCard("Espanhol", 10),
                //       skillCard("Alemão", 3),
                //     ],
                //   ),
                // )
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      elevation: 0,
                      highlightElevation: 0,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "SAIR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget skillCard(String title, int level) {
    return Row(
      children: [
        Container(
          width: 120,
          child: Text(
            "$title:",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ...List<Widget>.generate(level, (index) {
          return Icon(
            MdiIcons.circle,
            color: Colors.white,
            size: 15,
          );
        })
      ],
    );
  }

  List<Widget> projects() {
    return [
      projectCard(
        referenceUrl: "https://apps.apple.com/br/app/fada/id1336035665",
        imageUrl: "assets/about/projects/fada.png",
      ),
      projectCard(
        referenceUrl:
            "https://apps.apple.com/br/app/audi-connect-plug-and-play/id1439626815",
        imageUrl: "assets/about/projects/audi.png",
      ),
      projectCard(
        referenceUrl:
            "https://play.google.com/store/apps/details?id=br.com.tsystems.tsshift&hl=pt_BR",
        imageUrl: "assets/about/projects/shift.png",
      ),
      projectCard(
        referenceUrl: "https://apps.apple.com/br/app/even-t/id1500183702",
        imageUrl: "assets/about/projects/event.png",
      ),
      projectCard(
        referenceUrl:
            "https://apps.apple.com/br/app/t-systems-flow/id1502432429",
        imageUrl: "assets/about/projects/flow.png",
      ),
      projectCard(
        referenceUrl:
            "https://apps.apple.com/br/app/more-mobile-reports/id1459682366",
        imageUrl: "assets/about/projects/more.png",
      ),
    ];
  }

  Widget projectCard({String imageUrl, String referenceUrl}) {
    return GestureDetector(
      onTap: () => launchURL(referenceUrl),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.teal,
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover)),
        ),
      ),
    );
  }

  List<Widget> techStack() {
    return [
      techCard("assets/about/tech/flutter.png"),
      techCard("assets/about/tech/swift.png"),
      techCard("assets/about/tech/android.png"),
      techCard("assets/about/tech/kotlin.png"),
      techCard("assets/about/tech/sketch.png"),
      techCard("assets/about/tech/node.png"),
      techCard("assets/about/tech/github.png"),
      techCard("assets/about/tech/bitrise.png"),
      techCard("assets/about/tech/codemagic.png"),
      techCard("assets/about/tech/laravel.png"),
      techCard("assets/about/tech/mysql.jpg"),
      techCard("assets/about/tech/vue.png"),
      techCard("assets/about/tech/firebase.png"),
      techCard("assets/about/tech/jira.png"),
      techCard("assets/about/tech/sql.png"),
      techCard("assets/about/tech/api.png"),
    ];
  }

  Widget techCard(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(imageUrl), fit: BoxFit.contain)),
      ),
    );
  }
}
