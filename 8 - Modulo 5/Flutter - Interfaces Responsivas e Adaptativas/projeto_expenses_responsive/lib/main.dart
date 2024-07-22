import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Expenses',
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
          tertiary: Colors.grey,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 12,
            color: Colors.grey,
          ),
          labelMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  // Método Getter
  List<Transaction> get _getRecentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(const Duration(days: 7)),
      );
    }).toList();
  }

  // Método Setter
  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transaction(
        id: const Uuid().v4(),
        title: title,
        amount: amount,
        date: date,
      ));
    });

    Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(setTransaction: _addTransaction);
      },
    );
  }

  void _changeShowChart() {
    setState(() {
      _showChart = !_showChart;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          actions: [
            if (isLandscape)
              IconButton(
                icon: _showChart
                    ? const Icon(Icons.list, color: Colors.white)
                    : const Icon(Icons.show_chart, color: Colors.white),
                onPressed: () => _changeShowChart(),
              ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _openTransactionFormModal(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (_showChart || !isLandscape)
                SizedBox(
                  height: availableHeight * (isLandscape ? 0.7 : 0.3),
                  child: Chart(recentTransactions: _getRecentTransactions),
                ),
              if (!_showChart || !isLandscape)
                Center(
                  child: SizedBox(
                    height: availableHeight * (isLandscape ? 1 : 0.7),
                    child: TransactionList(
                      transactions: _transactions,
                      deleteTransaction: _deleteTransaction,
                    ),
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
