import 'package:flutter/material.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/widgets/divider_menu_bar.dart';
import 'package:loan_tracking/widgets/loan_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: accentColor,
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 29),
              child: Column(
                children: [
                  Text(
                    "Loaned money",
                    style: TextStyle(
                      fontSize: 12,
                      color: lightGrey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$ 5023",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            // Open loans
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 29,
                  ),
                  DividerMenuBar(
                    title: "Open loans",
                    onPressed: () {},
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
            ),
            // Closed loans
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 29,
                  ),
                  DividerMenuBar(
                    title: "Closed loans",
                    onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
