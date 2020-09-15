import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  final Function() changePasswordVisibility;
  final bool isPasswordValid;
  final bool obscurePassword;
  final FocusNode focusNode;
  final bool isEnabled;

  const PasswordField({
    Key key,
    this.onSubmitted,
    this.onChanged,
    @required this.isPasswordValid,
    @required this.obscurePassword,
    this.changePasswordVisibility,
    this.focusNode,
    @required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Stack(
        children: [
          Container(
            child: TextField(
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              autocorrect: false,
              focusNode: focusNode,
              obscureText: obscurePassword,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              enabled: isEnabled,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 10.0),
                hintText: "Password",
              ),
            ),
          ),
          Row(
            children: [
              customIcon(
                context: context,
                icon: obscurePassword ? Icons.lock_outline : Icons.lock_open,
                isActive: isPasswordValid,
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: changePasswordVisibility,
                child: customIcon(
                  context: context,
                  icon:
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                  isActive: isPasswordValid,
                ),
              ),
            ],
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
