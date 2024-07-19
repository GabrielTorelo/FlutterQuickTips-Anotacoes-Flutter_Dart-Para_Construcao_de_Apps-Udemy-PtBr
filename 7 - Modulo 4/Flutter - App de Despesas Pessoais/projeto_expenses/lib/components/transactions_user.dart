import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionsUser extends StatefulWidget {
  const TransactionsUser({super.key});

  @override
  State<TransactionsUser> createState() => _TransactionsUserState();
}

class _TransactionsUserState extends State<TransactionsUser> {
  final List<Transaction> _transactions = [];

  // Método Getter
  List<Transaction> get getTransactions {
    return _transactions;
  }

  // Método Setter
  void addTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(
        id: const Uuid().v4(),
        title: title,
        amount: amount,
        date: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: getTransactions),
        TransactionForm(setTransaction: addTransaction),
      ],
    );
  }
}
