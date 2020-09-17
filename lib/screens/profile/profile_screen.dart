import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:boti_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double avatarPositionAnimation = 50;
  double avatarOpacityAnimation = 0;
  bool avatarAnimationDone = false;
  bool shouldBegin = false;

  @override
  void initState() {
    super.initState();
  }

  void startProfilePresentation() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        avatarPositionAnimation = 0;
        avatarOpacityAnimation = 1;
      });
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        avatarAnimationDone = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: !shouldBegin
              ? Center(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: TypewriterAnimatedTextKit(
                      text: [
                        ">_",
                        "> olá!",
                        "> tudo bem?",
                        "> primeiramente, obrigado pelo desafio",
                        "> tentei colocar tudo que vocês pediram e mais um pouco neste app",
                        "> ele foi feito com carinho para mostrar pra vocês um pouco do que eu sei...",
                        "> espero que vocês gostem!",
                      ],
                      onFinished: () {
                        setState(() {
                          shouldBegin = true;
                          startProfilePresentation();
                        });
                      },
                      pause: Duration(milliseconds: 2000),
                      totalRepeatCount: 1,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "courier new"),
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: avatarOpacityAnimation,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.only(top: avatarPositionAnimation),
                        child: AvatarGlow(
                          glowColor: Colors.white,
                          endRadius: 140.0,
                          duration: Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 100),
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              backgroundImage: AssetImage(
                                'assets/about/diler.jpeg',
                              ),
                              radius: 80.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ...avatarAnimationDone
                        ? [
                            Container(
                              width: double.infinity,
                              child: TypewriterAnimatedTextKit(
                                text: [
                                  "DILER BARBOSA JR",
                                ],
                                totalRepeatCount: 1,
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TypewriterAnimatedTextKit(
                                text: [
                                  "dilermando.barbosa@gmail.com",
                                ],
                                totalRepeatCount: 1,
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: double.infinity,
                              child: TypewriterAnimatedTextKit(
                                text: [
                                  "+55 (41) 99694 4383",
                                ],
                                totalRepeatCount: 1,
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => LoginScreen()));
                                      },
                                      elevation: 0,
                                      highlightElevation: 0,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "APERTE PARA COMEÇAR",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]
                        : [Container()],
                  ],
                ),
        ),
      ),
    );
  }
}
