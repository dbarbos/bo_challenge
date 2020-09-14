// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStoreBase.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStoreBase.isPasswordValid'))
          .value;
  Computed<bool> _$isLoginFormValidComputed;

  @override
  bool get isLoginFormValid => (_$isLoginFormValidComputed ??= Computed<bool>(
          () => super.isLoginFormValid,
          name: '_LoginStoreBase.isLoginFormValid'))
      .value;

  final _$emailAtom = Atom(name: '_LoginStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

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

  final _$obscurePasswordAtom = Atom(name: '_LoginStoreBase.obscurePassword');

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

  final _$passwordFocusAtom = Atom(name: '_LoginStoreBase.passwordFocus');

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

  final _$isLoadingAtom = Atom(name: '_LoginStoreBase.isLoading');

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

  final _$isLoggedInAtom = Atom(name: '_LoginStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStoreBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void requestPasswordFocus(BuildContext context) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.requestPasswordFocus');
    try {
      return super.requestPasswordFocus(context);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
obscurePassword: ${obscurePassword},
passwordFocus: ${passwordFocus},
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isLoginFormValid: ${isLoginFormValid}
    ''';
  }
}
