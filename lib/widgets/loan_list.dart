import 'package:flutter/material.dart';
import 'package:loan_tracking/widgets/divider_menu_bar.dart';
import 'package:loan_tracking/widgets/loan_card.dart';

class LoanList extends StatelessWidget {
  const LoanList({
    @required this.title,
    @required this.icon,
    @required this.action,
    @required this.heroTag,
    @required this.loanCards,
  });

  final String title;
  final IconData icon;
  final Function action;
  final String heroTag;
  final List<Widget> loanCards;

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
              onPressed: action,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return loanCards[index];
            },
          )
        ],
      ),
    );
  }
}
