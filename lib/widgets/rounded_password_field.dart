import 'package:flutter/material.dart';
import 'package:loan_tracking/widgets/text_field_container.dart';
import 'package:loan_tracking/utils/custom_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: accentColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: accentColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: accentColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
