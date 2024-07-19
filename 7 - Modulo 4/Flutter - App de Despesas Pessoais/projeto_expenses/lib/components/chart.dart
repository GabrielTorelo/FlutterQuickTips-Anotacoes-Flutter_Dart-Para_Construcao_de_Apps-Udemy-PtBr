import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      double totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: groupedTransaction.map((data) {
          return ChartBar(
            label: data['day'].toString(),
            value: data['amount'] as double,
            percentage: 0.5,
          );
        }).toList(),
      ),
    );
  }
}
