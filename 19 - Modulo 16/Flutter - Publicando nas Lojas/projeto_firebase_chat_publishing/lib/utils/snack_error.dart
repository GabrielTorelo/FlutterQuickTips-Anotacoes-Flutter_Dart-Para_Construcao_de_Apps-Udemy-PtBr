import 'package:flutter/material.dart';

class SnackError {
  final BuildContext context;

  const SnackError(this.context);

  void show({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
