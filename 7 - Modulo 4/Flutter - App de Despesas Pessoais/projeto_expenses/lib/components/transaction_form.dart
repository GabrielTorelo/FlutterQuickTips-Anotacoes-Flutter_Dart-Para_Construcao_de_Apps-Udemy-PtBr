import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) setTransaction;

  const TransactionForm({super.key, required this.setTransaction});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text) ?? 0.0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.setTransaction(enteredTitle, enteredAmount);
    titleController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            onSubmitted: (_) => _submitData(),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount (\$)'),
            onSubmitted: (_) => _submitData(),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _submitData(),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
