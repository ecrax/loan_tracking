import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Loan> openLoans = List<Loan>();
  List<Loan> closedLoans = List<Loan>();

  @override
  void initState() {
    super.initState();

    // print(auth.currentUser.uid);

    openLoans = [
      Loan(
        name: "Jonathan",
        subject: "Food",
        amount: 14.5,
        isCompleted: false,
      ),
      Loan(
        name: "Jonathan",
        subject: "Food",
        amount: 14.5,
        isCompleted: false,
      ),
      Loan(
        name: "Jonathan",
        subject: "Food",
        amount: 14.5,
        isCompleted: false,
      ),
    ];

    closedLoans = [
      Loan(
        name: "Leo",
        subject: "Food",
        amount: 14.5,
        isCompleted: true,
      ),
      Loan(
        name: "Leo",
        subject: "Food",
        amount: 14.5,
        isCompleted: true,
      ),
      Loan(
        name: "Leo",
        subject: "Food",
        amount: 14.5,
        isCompleted: true,
      ),
    ];
  }

  double getAmountSum(List<Loan> loans) {
    double sum = 0;

    for (var loan in loans) {
      sum += loan.amount;
    }
    return sum;
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
                      "\$ ${getAmountSum(openLoans).toStringAsFixed(2)}",
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
                loans: openLoans,
                icon: Icons.keyboard_arrow_right,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OpenLoansScreen(
                          loans: openLoans,
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
                loans: closedLoans,
                icon: Icons.keyboard_arrow_right,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ClosedLoansScreen(
                          loans: closedLoans,
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
