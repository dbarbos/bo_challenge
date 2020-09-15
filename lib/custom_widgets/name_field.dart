import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final Function(BuildContext) onSubmitted;
  final Function(String) onChanged;
  final bool isNameValid;
  final bool isEnabled;

  const NameField(
      {Key key,
      this.onSubmitted,
      this.onChanged,
      @required this.isNameValid,
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
                icon: Icons.person_outline,
                isActive: isNameValid,
              ),
              Expanded(
                child: Container(),
              ),
              isNameValid
                  ? customIcon(
                      context: context,
                      icon: Icons.check,
                      isActive: isNameValid,
                    )
                  : Container(),
            ],
          ),
          Container(
            child: TextField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              autocorrect: false,
              enabled: isEnabled,
              onSubmitted: (value) {
                onSubmitted(context);
              },
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 10.0),
                hintText: "Nome completo",
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
