import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;

  final Function() action;

  const LoginButton(
      {Key key,
      @required this.isEnabled,
      this.action,
      @required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton(
        onPressed: isEnabled ? action : null,
        elevation: 0,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: isLoading
            ? Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
