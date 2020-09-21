import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/loan.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

class ClosedLoansScreen extends StatelessWidget {
  const ClosedLoansScreen({this.loans});

  final List<Loan> loans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoanList(
          title: "Closed loans",
          heroTag: "ClosedLoans",
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
