import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:boti_challenge/screens/login/custom_widgets/go_to_create_account_button.dart';
import 'package:boti_challenge/screens/login/extra/custom_login_background_painter.dart';
import 'package:boti_challenge/screens/main_tab_screen/main_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'custom_widgets/email_field.dart';
import 'custom_widgets/login_button.dart';
import 'custom_widgets/password_field.dart';
import 'stores/loginstore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    autorun((_) {
      if (loginStore.isLoggedIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => MainTabScreen()));
      }
    });
  }

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
                            "Bem-vindo(a) \nde volta",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                      Observer(builder: (_) {
                        return EmailField(
                          onSubmitted: loginStore.requestPasswordFocus,
                          onChanged: loginStore.changeEmail,
                          isEmailValid: loginStore.isEmailValid,
                          isEnabled: !loginStore.isLoading,
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      Observer(builder: (_) {
                        return PasswordField(
                          focusNode: loginStore.passwordFocus,
                          onSubmitted: (value) => print(value),
                          onChanged: loginStore.changePassword,
                          isPasswordValid: loginStore.isPasswordValid,
                          changePasswordVisibility:
                              loginStore.changePasswordVisibility,
                          obscurePassword: loginStore.obscurePassword,
                          isEnabled: !loginStore.isLoading,
                        );
                      }),
                      Container(
                        height: 44,
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 8),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              showOkAlertDialog(
                                  context: context,
                                  title: "Sinto muito!",
                                  message:
                                      "Esse projeto é só uma demo. Mas repare que essa Dialog é Platfom aware! ;D");
                            },
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Observer(builder: (_) {
                        return LoginButton(
                          isEnabled: loginStore.isLoginFormValid,
                          isLoading: loginStore.isLoading,
                          action: loginStore.login,
                        );
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "ou",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      GoToCreateAccountButton(),
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
