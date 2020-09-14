import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function(BuildContext) onSubmitted;
  final Function(String) onChanged;
  final bool isEmailValid;
  final bool isEnabled;

  const EmailField(
      {Key key,
      this.onSubmitted,
      this.onChanged,
      @required this.isEmailValid,
      @required this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Stack(
        children: [
          Row(
            children: [
              customIcon(
                context: context,
                icon: Icons.email,
                isActive: isEmailValid,
              ),
              Expanded(
                child: Container(),
              ),
              isEmailValid
                  ? customIcon(
                      context: context,
                      icon: Icons.check,
                      isActive: isEmailValid,
                    )
                  : Container(),
            ],
          ),
          Container(
            child: TextField(
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              enabled: isEnabled,
              onSubmitted: (value) {
                onSubmitted(context);
              },
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 10.0),
                hintText: "E-mail",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customIcon({IconData icon, bool isActive, BuildContext context}) {
    return Container(
      width: 30,
      child: Icon(
        icon,
        size: 18,
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
      ),
    );
  }
}
