import 'package:flutter/material.dart';

class AlertError extends StatelessWidget {
  const AlertError({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('An error occurred!'),
      content: const Text('Something went wrong.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
