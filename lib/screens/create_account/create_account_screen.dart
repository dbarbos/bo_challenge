import 'package:boti_challenge/custom_widgets/create_account_button.dart';
import 'package:boti_challenge/custom_widgets/email_field.dart';
import 'package:boti_challenge/custom_widgets/go_to_login_button.dart';
import 'package:boti_challenge/custom_widgets/name_field.dart';
import 'package:boti_challenge/custom_widgets/password_field.dart';
import 'package:boti_challenge/extra/custom_login_background_painter.dart';
import 'package:boti_challenge/screens/main_tab/main_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'stores/createaccountstore.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  CreateAccountStore createAccountStore = CreateAccountStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    autorun((_) {
      if (createAccountStore.loginStore.isLoggedIn) {
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
                    height: MediaQuery.of(context).size.height - 350,
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
                        height: MediaQuery.of(context).size.height - 375,
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
                      Observer(builder: (_) {
                        return NameField(
                          isEnabled: !createAccountStore.isLoading,
                          isNameValid: createAccountStore.isNameValid,
                          onChanged: createAccountStore.changeName,
                          onSubmitted: createAccountStore.requestEmailFocus,
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      Observer(builder: (_) {
                        return EmailField(
                          focusNode: createAccountStore.emailFocus,
                          onSubmitted: createAccountStore.requestPasswordFocus,
                          onChanged: createAccountStore.changeEmail,
                          isEmailValid: createAccountStore.isEmailValid,
                          isEnabled: !createAccountStore.isLoading,
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      Observer(builder: (_) {
                        return PasswordField(
                          focusNode: createAccountStore.passwordFocus,
                          onChanged: createAccountStore.changePassword,
                          isPasswordValid: createAccountStore.isPasswordValid,
                          changePasswordVisibility:
                              createAccountStore.changePasswordVisibility,
                          obscurePassword: createAccountStore.obscurePassword,
                          isEnabled: !createAccountStore.isLoading,
                        );
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      Observer(builder: (_) {
                        return CreateAccountButton(
                          isEnabled:
                              createAccountStore.isCreateAccountFormValid,
                          isLoading: createAccountStore.isLoading,
                          action: createAccountStore.createAccountAndLogin,
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
