import 'package:boti_challenge/screens/create_account/stores/createaccountstore.dart';
import 'package:boti_challenge/screens/login/stores/loginstore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Create Account Store', () {
    final store = CreateAccountStore();

    test('User name change', () {
      store.changeName("Diler Barbosa");
      expect(store.name, "Diler Barbosa");
    });

    test('Email change', () {
      store.changeEmail("diler@teste.com");
      expect(store.email, "diler@teste.com");
    });

    test('Password change', () {
      store.changePassword("123456");
      expect(store.password, "123456");
    });

    test('User name validation should be valid', () {
      store.changeName("Diler Barbosa");
      expect(store.isNameValid, true);
    });

    test('Email validation should be valid', () {
      store.changeEmail("diler@teste.com");
      expect(store.isEmailValid, true);
    });

    test('Password validation should be valid', () {
      store.changePassword("123456");
      expect(store.isPasswordValid, true);
    });

    test('User name validation should be invalid', () {
      store.changeName("");
      expect(store.isNameValid, false);
    });

    test('Email validation should be invalid', () {
      store.changeEmail("diler.com");
      expect(store.isEmailValid, false);
    });

    test('Password validation should be invalid', () {
      store.changePassword("1234");
      expect(store.isPasswordValid, false);
    });

    test('Create Account form validation should be valid', () {
      store.changeName("Diler Barbosa");
      store.changeEmail("diler@teste.com");
      store.changePassword("123456");
      expect(store.isCreateAccountFormValid, true);
    });
  });

  group('Login Store', () {
    final store = LoginStore();

    test('Email change', () {
      store.changeEmail("diler@teste.com");
      expect(store.email, "diler@teste.com");
    });

    test('Password change', () {
      store.changePassword("123456");
      expect(store.password, "123456");
    });

    test('Email validation should be valid', () {
      store.changeEmail("diler@teste.com");
      expect(store.isEmailValid, true);
    });

    test('Password validation should be valid', () {
      store.changePassword("123456");
      expect(store.isPasswordValid, true);
    });

    test('Email validation should be invalid', () {
      store.changeEmail("diler.com");
      expect(store.isEmailValid, false);
    });

    test('Password validation should be invalid', () {
      store.changePassword("1234");
      expect(store.isPasswordValid, false);
    });

    test('Login form validation should be valid', () {
      store.changeEmail("diler@teste.com");
      store.changePassword("123456");
      expect(store.isLoginFormValid, true);
    });
  });
}
