import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loan_tracking/screens/add_loan_screen.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> futureLoans;

  List<Loan> openLoans = List<Loan>();
  List<Loan> closedLoans = List<Loan>();

  @override
  void initState() {
    super.initState();

    getData();
    fillLists();

    print(auth.currentUser.uid);
  }

  Future getData() async {
    setState(() {
      futureLoans =
          firestore.collection("loans").doc(auth.currentUser.uid).get();
    });
  }

  Future fillLists() async {
    DocumentSnapshot snapshot = await futureLoans;

    for (var i = 1; i <= snapshot.data().length; i++) {
      if (snapshot.data()["loan$i"]["isCompleted"]) {
        openLoans.add(Loan(
          name: snapshot.data()["loan$i"]["name"],
          subject: snapshot.data()["loan$i"]["subject"],
          amount: snapshot.data()["loan$i"]["amount"],
          isCompleted: true,
        ));
      } else {
        closedLoans.add(Loan(
          name: snapshot.data()["loan$i"]["name"],
          subject: snapshot.data()["loan$i"]["subject"],
          amount: snapshot.data()["loan$i"]["amount"],
          isCompleted: false,
        ));
      }
    }
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
              FutureBuilder(
                future: futureLoans,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LoanList(
                      title: "Open loans",
                      heroTag: "OpenLoans",
                      loans: openLoans,
                      icon: Icons.keyboard_arrow_right,
                      onDissmissed: (index, loan) {
                        setState(() {
                          // Mark loan as closed
                          openLoans.removeAt(index);
                          closedLoans.add(loan);

                          // Database handling?
                        });

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Marked as closed"),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(
                height: 29,
              ),
              // Closed loans
              FutureBuilder(
                future: futureLoans,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LoanList(
                      title: "Closed loans",
                      heroTag: "ClosedLoans",
                      loans: closedLoans,
                      icon: Icons.keyboard_arrow_right,
                      onDissmissed: (index, loan) {
                        setState(() {
                          // Mark loan as open
                          closedLoans.removeAt(index);
                          openLoans.add(loan);

                          // Database handling?
                        });

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Marked as open"),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
