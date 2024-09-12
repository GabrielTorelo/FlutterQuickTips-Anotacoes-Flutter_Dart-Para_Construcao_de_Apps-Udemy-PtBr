import 'package:flutter/material.dart';

class AlertError extends StatelessWidget {
  final String? message;

  const AlertError({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('An error occurred!'),
      content: Text(message ?? 'Something went wrong.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
