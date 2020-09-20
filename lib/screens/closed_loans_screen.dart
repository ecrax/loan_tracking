import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

class ClosedLoansScreen extends StatelessWidget {
  const ClosedLoansScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightAccentColor,
      body: SafeArea(
        child: LoanList(
          title: "Closed loans",
          heroTag: "ClosedLoans",
          icon: Icons.arrow_back_ios,
          action: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
