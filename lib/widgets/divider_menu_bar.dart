import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';

class DividerMenuBar extends StatelessWidget {
  const DividerMenuBar({
    @required this.title,
    @required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: lightAccentColor,
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: accentColor),
          ),
          GestureDetector(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: accentColor,
            ),
            onTap: onPressed,
          )
        ],
      ),
    );
  }
}
