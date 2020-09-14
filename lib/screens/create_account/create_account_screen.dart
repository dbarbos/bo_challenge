import 'package:boti_challenge/screens/login/custom_widgets/go_to_login_button.dart';
import 'package:boti_challenge/screens/login/extra/custom_login_background_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 320,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: CustomLoginBackgroundPainter(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                  ),
                ],
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 340,
                        child: Align(
                          alignment: Alignment(-1, -0.2),
                          child: Text(
                            "Criar \numa conta",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                      GoToLoginButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
