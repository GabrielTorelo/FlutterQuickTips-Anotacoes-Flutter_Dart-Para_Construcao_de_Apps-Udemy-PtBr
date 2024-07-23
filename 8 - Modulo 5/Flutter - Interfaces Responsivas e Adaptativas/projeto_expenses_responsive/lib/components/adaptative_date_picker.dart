import 'package:expenses/extensions/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    super.key,
    this.selectedDate,
    required this.onDateChanged,
  });

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Device.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2021),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Picked Date: ${DateFormat('dd/MM/yyyy').format(selectedDate ?? DateTime.now())}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: const Text('Choose Date'),
                ),
              ],
            ),
          );
  }
}
