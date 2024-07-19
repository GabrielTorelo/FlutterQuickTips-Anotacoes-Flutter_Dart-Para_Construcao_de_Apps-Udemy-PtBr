import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final void Function(String, double) setTransaction;

  TransactionForm({super.key, required this.setTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount (\$)'),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {
                    setTransaction(
                      titleController.text,
                      double.parse(amountController.text),
                    ),
                    titleController.clear(),
                    amountController.clear(),
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.purple,
                  ),
                  child: const Text('Add Transaction'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
