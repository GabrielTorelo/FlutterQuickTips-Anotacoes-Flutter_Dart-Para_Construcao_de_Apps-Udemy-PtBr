import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) setTransaction;

  const TransactionForm({super.key, required this.setTransaction});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0.0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.setTransaction(enteredTitle, enteredAmount);
    _titleController.clear();
    _amountController.clear();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            onSubmitted: (_) => _submitData(),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Amount (\$)'),
            onSubmitted: (_) => _submitData(),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(),
                  child: const Text('Choose Date'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _submitData(),
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
