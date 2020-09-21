import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/loan.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

class OpenLoansScreen extends StatelessWidget {
  const OpenLoansScreen({this.loans});

  final List<Loan> loans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoanList(
          title: "Open loans",
          heroTag: "OpenLoans",
          loans: loans,
          icon: Icons.keyboard_arrow_down,
          action: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
