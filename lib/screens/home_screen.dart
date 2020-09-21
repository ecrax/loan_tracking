import 'package:flutter/material.dart';
import 'package:loan_tracking/screens/add_loan_screen.dart';
import 'package:loan_tracking/screens/closed_loans_screen.dart';
import 'package:loan_tracking/screens/open_loans_screen.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/utils/loan.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Loan> loans = List<Loan>();

  @override
  void initState() {
    super.initState();

    loans = [
      Loan(
        name: "Jonathan",
        subject: "Food",
        amount: 14.5,
      ),
      Loan(
        name: "Jonathan",
        subject: "Food",
        amount: 14.5,
      ),
      Loan(
        name: "Jonathan",
        subject: "Food",
        amount: 14.5,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 29),
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
                loans: loans,
                icon: Icons.keyboard_arrow_right,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OpenLoansScreen(
                          loans: loans,
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
                loans: loans,
                icon: Icons.keyboard_arrow_right,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ClosedLoansScreen(
                          loans: loans,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
