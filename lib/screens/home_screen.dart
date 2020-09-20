import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan_tracking/screens/add_loan_screen.dart';
import 'package:loan_tracking/screens/closed_loans_screen.dart';
import 'package:loan_tracking/screens/open_loans_screen.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/widgets/loan_card.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> loanCards = List<LoanCard>();

  @override
  void initState() {
    super.initState();

    loanCards = [
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
        isLast: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Add"),
        backgroundColor: accentColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddLoanScreen();
              },
            ),
          );
        },
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
                  SizedBox(
                    height: 29,
                  ),
                ],
              ),
            ),
            // Open loans
            LoanList(
              title: "Open loans",
              heroTag: "OpenLoans",
              loanCards: loanCards,
              icon: Icons.arrow_forward_ios,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OpenLoansScreen(
                        loanCards: loanCards,
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 29,
            ),
            // Closed loans
            LoanList(
              title: "Closed loans",
              heroTag: "ClosedLoans",
              loanCards: loanCards,
              icon: Icons.arrow_forward_ios,
              action: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return ClosedLoansScreen(
                        loanCards: loanCards,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
