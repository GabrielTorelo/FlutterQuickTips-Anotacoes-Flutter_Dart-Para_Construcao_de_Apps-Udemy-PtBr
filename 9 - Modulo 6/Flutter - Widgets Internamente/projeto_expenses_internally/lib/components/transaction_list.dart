import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions; // Atributo final
  final void Function(String) deleteTransaction; // Atributo final

  // Para definir um construtor como "const", todos os atributos devem ser "final"
  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * 0.6,
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return TransactionItem(
                  key: GlobalObjectKey(transaction),
                  transaction: transaction,
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}
