import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/utils/loan.dart';
import 'package:loan_tracking/widgets/divider_menu_bar.dart';
import 'package:loan_tracking/widgets/loan_card.dart';

class LoanList extends StatelessWidget {
  const LoanList({
    @required this.title,
    @required this.icon,
    @required this.heroTag,
    @required this.loans,
    @required this.onDissmissed,
  });

  final String title;
  final IconData icon;

  final String heroTag;
  final List<Loan> loans;
  final Function(int, Loan) onDissmissed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: heroTag,
            child: DividerMenuBar(
              title: title,
              icon: icon,
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: loans.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: accentColor,
                ),
                child: LoanCard(
                  name: loans[index].name,
                  subject: loans[index].subject,
                  amount: loans[index].amount,
                  isLast: index == loans.length - 1,
                ),
                onDismissed: (direction) {
                  onDissmissed(index, loans[index]);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
