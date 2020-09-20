import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan_tracking/screens/closed_loans_screen.dart';
import 'package:loan_tracking/screens/open_loans_screen.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

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
              icon: Icons.arrow_forward_ios,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OpenLoansScreen();
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
              icon: Icons.arrow_forward_ios,
              action: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return ClosedLoansScreen();
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
