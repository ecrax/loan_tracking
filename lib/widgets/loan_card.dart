import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({
    this.name,
    this.subject,
    this.amount,
    this.isLast = false,
  });

  final String name;
  final String subject;
  final double amount;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: !isLast
            ? Border(
                bottom: BorderSide(
                  color: Color(0xFFE5E5E5),
                  width: 1,
                ),
              )
            : null,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 39,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                subject,
                style: TextStyle(
                  fontSize: 12,
                  color: lightGrey,
                ),
              ),
            ],
          ),
          Text(
            "\$ ${amount.toStringAsFixed(2)}",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
