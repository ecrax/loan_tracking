import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';

class DividerMenuBar extends StatelessWidget {
  const DividerMenuBar({
    @required this.title,
    @required this.icon,
    @required this.onPressed,
  });

  final String title;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 36,
        color: lightAccentColor,
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,
              child: Text(
                title,
                style: TextStyle(fontSize: 14, color: accentColor),
              ),
            ),
            Icon(
              icon,
              size: 14,
              color: accentColor,
            )
          ],
        ),
      ),
    );
  }
}
