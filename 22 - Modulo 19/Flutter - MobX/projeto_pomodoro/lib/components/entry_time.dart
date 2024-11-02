import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/components/arrow_button.dart';

class EntryTime extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? onIncrementPressed;
  final void Function()? onDecrementPressed;

  const EntryTime({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrementPressed,
    required this.onDecrementPressed,
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
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: onDecrementPressed ?? () {},
            ),
            Text(
              '$value min',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ArrowButton(
              icon: Icons.arrow_upward,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: onIncrementPressed ?? () {},
            ),
          ],
        ),
      ],
    );
  }
}
