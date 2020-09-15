// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createaccountstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountStore on _CreateAccountBase, Store {
  Computed<bool> _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_CreateAccountBase.isNameValid'))
          .value;
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_CreateAccountBase.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_CreateAccountBase.isPasswordValid'))
          .value;
  Computed<bool> _$isCreateAccountFormValidComputed;

  @override
  bool get isCreateAccountFormValid => (_$isCreateAccountFormValidComputed ??=
          Computed<bool>(() => super.isCreateAccountFormValid,
              name: '_CreateAccountBase.isCreateAccountFormValid'))
      .value;

  final _$nameAtom = Atom(name: '_CreateAccountBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_CreateAccountBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$emailFocusAtom = Atom(name: '_CreateAccountBase.emailFocus');

  @override
  FocusNode get emailFocus {
    _$emailFocusAtom.reportRead();
    return super.emailFocus;
  }

  @override
  set emailFocus(FocusNode value) {
    _$emailFocusAtom.reportWrite(value, super.emailFocus, () {
      super.emailFocus = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CreateAccountBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$obscurePasswordAtom =
      Atom(name: '_CreateAccountBase.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  final _$passwordFocusAtom = Atom(name: '_CreateAccountBase.passwordFocus');

  @override
  FocusNode get passwordFocus {
    _$passwordFocusAtom.reportRead();
    return super.passwordFocus;
  }

  @override
  set passwordFocus(FocusNode value) {
    _$passwordFocusAtom.reportWrite(value, super.passwordFocus, () {
      super.passwordFocus = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CreateAccountBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$createAccountAndLoginAsyncAction =
      AsyncAction('_CreateAccountBase.createAccountAndLogin');

  @override
  Future<void> createAccountAndLogin() {
    return _$createAccountAndLoginAsyncAction
        .run(() => super.createAccountAndLogin());
  }

  final _$_CreateAccountBaseActionController =
      ActionController(name: '_CreateAccountBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_CreateAccountBaseActionController.startAction(
        name: '_CreateAccountBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_CreateAccountBaseActionController.startAction(
        name: '_CreateAccountBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void requestEmailFocus(BuildContext context) {
    final _$actionInfo = _$_CreateAccountBaseActionController.startAction(
        name: '_CreateAccountBase.requestEmailFocus');
    try {
      return super.requestEmailFocus(context);
    } finally {
      _$_CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void requestPasswordFocus(BuildContext context) {
    final _$actionInfo = _$_CreateAccountBaseActionController.startAction(
        name: '_CreateAccountBase.requestPasswordFocus');
    try {
      return super.requestPasswordFocus(context);
    } finally {
      _$_CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_CreateAccountBaseActionController.startAction(
        name: '_CreateAccountBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$_CreateAccountBaseActionController.startAction(
        name: '_CreateAccountBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
emailFocus: ${emailFocus},
password: ${password},
obscurePassword: ${obscurePassword},
passwordFocus: ${passwordFocus},
isLoading: ${isLoading},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isCreateAccountFormValid: ${isCreateAccountFormValid}
    ''';
  }
}
