import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/components/arrow_button.dart';

class EntryTime extends StatelessWidget {
  final String title;
  final int value;

  const EntryTime({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowButton(
              icon: Icons.arrow_downward,
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
            Text(
              '$value min',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ArrowButton(
              icon: Icons.arrow_upward,
              backgroundColor: Colors.green,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
