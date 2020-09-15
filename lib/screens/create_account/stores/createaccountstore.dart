import 'package:boti_challenge/screens/login/stores/loginstore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'createaccountstore.g.dart';

class CreateAccountStore = _CreateAccountBase with _$CreateAccountStore;

abstract class _CreateAccountBase with Store {
  var loginStore = LoginStore();

  // NAME *********************************************

  @observable
  String name = "";

  @action
  changeName(String value) => name = value;

  @computed
  bool get isNameValid => name.isNotEmpty;

  // EMAIL *********************************************

  @observable
  String email = "";

  @observable
  FocusNode emailFocus = FocusNode();

  @action
  changeEmail(String value) => email = value;

  @action
  void requestEmailFocus(BuildContext context) =>
      FocusScope.of(context).requestFocus(emailFocus);

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  // PASSWORD *********************************************

  @observable
  String password = "";

  @observable
  bool obscurePassword = true;

  @observable
  FocusNode passwordFocus = FocusNode();

  @action
  void requestPasswordFocus(BuildContext context) =>
      FocusScope.of(context).requestFocus(passwordFocus);

  @action
  changePassword(String value) => password = value;

  @action
  void changePasswordVisibility() => obscurePassword = !obscurePassword;

  @computed
  bool get isPasswordValid => password.length >= 6;

  // CREATE ACCOUNT BUTTON *********************************************

  @observable
  bool isLoading = false;

  @action
  Future<void> createAccountAndLogin() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 2));

    if (isCreateAccountFormValid) {
      loginStore.changeEmail(email);
      loginStore.changePassword(password);
      loginStore.login();
    }

    isLoading = false;
    name = "";
    email = "";
    password = "";
  }

  @computed
  bool get isCreateAccountFormValid =>
      isNameValid && isEmailValid && isPasswordValid;
}
