import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_field.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) setTransaction;

  // O construtor é chamado sempre que o widget é reconstruído
  TransactionForm({super.key, required this.setTransaction}) {
    print('Constructor TransactionForm');
  }

  // O método 'createState' é chamado sempre que o widget é reconstruído
  @override
  State<TransactionForm> createState() {
    print('CreateState TransactionForm');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // O construtor é chamado sempre que o widget é reconstruído
  _TransactionFormState() {
    print('Constructor _TransactionFormState');
  }

  // O método 'initState' é chamado uma única vez, quando o widget é inserido na árvore de widgets
  @override
  void initState() {
    super.initState();
    print('InitState _TransactionFormState');
  }

  // O método 'didUpdateWidget' é chamado sempre que o widget pai for reconstruído
  @override
  void didUpdateWidget(covariant TransactionForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('DidUpdateWidget _TransactionFormState');
  }

  // O método 'dispose' é chamado uma única vez, quando o widget é removido da árvore de widgets
  @override
  void dispose() {
    super.dispose();
    print('Dispose _TransactionFormState');
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0.0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.setTransaction(enteredTitle, enteredAmount, _selectedDate);
    _titleController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New Transaction',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AdaptativeTextField(
              controller: _titleController,
              label: "Title",
              onSubmitted: _submitData,
            ),
            AdaptativeTextField(
              controller: _amountController,
              label: "Amount (\$)",
              onSubmitted: _submitData,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                  label: 'Add Transaction',
                  onPressed: _submitData,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
