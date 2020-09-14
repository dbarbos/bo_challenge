import 'package:boti_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class GoToLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LoginScreen()));
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
          "Login",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
