import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/extensions/platform.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
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

  Widget _getIconButton(
      {required IconData icon, required Function() onPressed}) {
    return Device.isIOS
        ? GestureDetector(
            onTap: onPressed,
            child: Icon(icon, color: Colors.white),
          )
        : IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          );
  }

  @override
  Widget build(BuildContext context) {
    print('build() _MyHomePageState');
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final List<Widget> actions = [
      if (isLandscape)
        _getIconButton(
          icon: Device.isIOS
              ? _showChart
                  ? CupertinoIcons.list_bullet
                  : CupertinoIcons.chart_bar
              : _showChart
                  ? Icons.list
                  : Icons.show_chart,
          onPressed: _changeShowChart,
        ),
      _getIconButton(
        icon: Device.isIOS ? CupertinoIcons.add : Icons.add,
        onPressed: () => _openTransactionFormModal(context),
      ),
    ];

    const title = Text('Personal Expenses');

    final double availableHeight = mediaQuery.size.height -
        AppBar().preferredSize.height -
        mediaQuery.padding.top;

    final SafeArea bodyPage = SafeArea(
      child: SingleChildScrollView(
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
    );

    return Center(
      child: Device.isIOS
          ? CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: title,
                backgroundColor: Theme.of(context).colorScheme.primary,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                ),
              ),
              child: bodyPage,
            )
          : Scaffold(
              appBar: AppBar(
                title: title,
                backgroundColor: Theme.of(context).colorScheme.primary,
                centerTitle: true,
                actions: actions,
              ),
              body: bodyPage,
              floatingActionButton: Device.isIOS
                  ? Container()
                  : FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(Icons.add),
                      onPressed: () => _openTransactionFormModal(context),
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
    );
  }
}
