import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/utils/loan.dart';
import 'package:loan_tracking/widgets/divider_menu_bar.dart';
import 'package:loan_tracking/widgets/loan_card.dart';

class LoanList extends StatefulWidget {
  const LoanList({
    @required this.title,
    @required this.icon,
    @required this.action,
    @required this.heroTag,
    @required this.loans,
  });

  final String title;
  final IconData icon;
  final Function action;
  final String heroTag;
  final List<Loan> loans;

  @override
  _LoanListState createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: widget.heroTag,
            child: DividerMenuBar(
              title: widget.title,
              icon: widget.icon,
              onPressed: widget.action,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.loans.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: accentColor,
                ),
                child: LoanCard(
                  name: widget.loans[index].name,
                  subject: widget.loans[index].subject,
                  amount: widget.loans[index].amount,
                  isLast: index == widget.loans.length - 1,
                ),
                onDismissed: (direction) {
                  setState(() {
                    // Mark loan as closed
                    widget.loans.removeAt(index);
                  });

                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Marked as closed"),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
