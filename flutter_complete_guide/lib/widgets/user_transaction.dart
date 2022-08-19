import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import '../models/transaction.dart';


class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id:'t1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id:'t2', title: 'Weekly Groceries', amount: 16.54, date: DateTime.now()),
  ];

  void _addNewTransaction(String txtitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txAmount,
        date: DateTime.now());

    setState() {
      _userTransaction.add(newTx);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransaction)
      ]
    );
  }
}

