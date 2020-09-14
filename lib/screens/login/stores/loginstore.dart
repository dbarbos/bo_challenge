import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'loginstore.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    autorun((_) {
      print(isLoggedIn);
    });
  }

  // EMAIL *********************************************

  @observable
  String email = "";

  @action
  changeEmail(String value) => email = value;

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

  // LOGIN BUTTON *********************************************

  @observable
  bool isLoading = false;

  @action
  Future<void> login() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 2));

    isLoading = false;
    isLoggedIn = true;
    email = "";
    password = "";
  }

  // FORM GENERAL *********************************************

  @observable
  bool isLoggedIn = false;

  @computed
  bool get isLoginFormValid => isEmailValid && isPasswordValid;
}
