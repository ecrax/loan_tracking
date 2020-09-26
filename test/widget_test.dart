// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loan_tracking/utils/loan.dart';
import 'package:loan_tracking/widgets/loan_list.dart';

void main() {
  testWidgets('Loan list test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              LoanList(
                title: "Closed loans",
                heroTag: "ClosedLoans",
                loans: [
                  Loan(
                    name: "name",
                    subject: "subject",
                    amount: 14.54,
                    isCompleted: true,
                  ),
                ],
                icon: Icons.keyboard_arrow_right,
                action: () {},
              ),
            ],
          ),
        ),
      ),
    );

    final nameFinder = find.text('name');
    final subjectFinder = find.text('subject');

    expect(nameFinder, findsWidgets);
    expect(subjectFinder, findsWidgets);
  });
}
