import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

class ClosedLoansScreen extends StatelessWidget {
  const ClosedLoansScreen({this.loanCards});

  final List<Widget> loanCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoanList(
          title: "Closed loans",
          heroTag: "ClosedLoans",
          loanCards: loanCards,
          icon: Icons.arrow_back_ios,
          action: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
