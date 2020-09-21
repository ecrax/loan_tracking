import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:loan_tracking/utils/custom_colors.dart';
import 'package:loan_tracking/widgets/divider_menu_bar.dart';

class AddLoanScreen extends StatefulWidget {
  const AddLoanScreen({Key key}) : super(key: key);

  @override
  _AddLoanScreenState createState() => _AddLoanScreenState();
}

class _AddLoanScreenState extends State<AddLoanScreen> {
  final amountController = MoneyMaskedTextController(
    decimalSeparator: ".",
    thousandSeparator: ",",
  );

  String dropdownValue = "Food";
  String nameValue = "";
  String amountValue = "0.00";

  void addLoan() {
    // Add to firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addLoan,
        icon: Icon(Icons.save),
        label: Text("Create"),
        backgroundColor: accentColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            DividerMenuBar(
              title: "Add loan",
              icon: Icons.keyboard_arrow_down,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 29,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    onChanged: (value) {
                      nameValue = value;
                    },
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text("Food"),
                        value: "Food",
                      ),
                      DropdownMenuItem(
                        child: Text("Tech"),
                        value: "Tech",
                      ),
                      DropdownMenuItem(
                        child: Text("Subscription"),
                        value: "Subscription",
                      ),
                    ],
                    value: dropdownValue,
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      amountValue = value;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
