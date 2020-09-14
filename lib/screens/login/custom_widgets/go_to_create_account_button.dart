import 'package:boti_challenge/screens/create_account/create_account_screen.dart';
import 'package:flutter/material.dart';

class GoToCreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => CreateAccountScreen()));
        },
        elevation: 0,
        highlightElevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          "Criar conta",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
