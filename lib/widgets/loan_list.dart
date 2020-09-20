import 'package:flutter/material.dart';
import 'package:loan_tracking/widgets/divider_menu_bar.dart';
import 'package:loan_tracking/widgets/loan_card.dart';

class LoanList extends StatelessWidget {
  const LoanList({
    @required this.title,
    @required this.icon,
    @required this.action,
    @required this.heroTag,
  });

  final String title;
  final IconData icon;
  final Function action;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Hero(
            tag: heroTag,
            child: DividerMenuBar(
              title: title,
              icon: icon,
              onPressed: action,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 18,
              ),
              LoanCard(
                name: "Jonathan",
                subject: "Food",
                amount: 14.5,
              ),
              LoanCard(
                name: "Jonathan",
                subject: "Food",
                amount: 14.5,
              ),
              LoanCard(
                name: "Jonathan",
                subject: "Food",
                amount: 14.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
