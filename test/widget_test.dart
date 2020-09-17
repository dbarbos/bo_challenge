import 'package:boti_challenge/custom_widgets/email_field.dart';
import 'package:boti_challenge/screens/login/stores/loginstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Field Widget', () {
    testWidgets('Pump widget and type something', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: EmailField(
            isEnabled: true,
            isEmailValid: true,
            onSubmitted: (value) => value,
          ),
        ),
      ));

      await tester.enterText(find.byType(EmailField), 'diler@teste.com');

      final emailText = find.text('diler@teste.com');
      expect(emailText, findsOneWidget);
    });

    testWidgets('Pump widget with store and validate input',
        (WidgetTester tester) async {
      var store = LoginStore();

      var widget = Observer(builder: (_) {
        return EmailField(
          isEnabled: true,
          isEmailValid: store.isEmailValid,
          onChanged: store.changeEmail,
        );
      });

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      await tester.enterText(find.byType(EmailField), 'diler@teste.com');

      final emailText = find.text('diler@teste.com');

      expect(emailText, findsOneWidget);
      expect(store.isEmailValid, true);
    });

    testWidgets('Pump widget with store and validate input should be invalid',
        (WidgetTester tester) async {
      var store = LoginStore();

      var widget = Observer(builder: (_) {
        return EmailField(
          isEnabled: true,
          isEmailValid: store.isEmailValid,
          onChanged: store.changeEmail,
        );
      });

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      await tester.enterText(find.byType(EmailField), 'diler');

      final emailText = find.text('diler');

      expect(emailText, findsOneWidget);
      expect(store.isEmailValid, false);
    });
  });
}
