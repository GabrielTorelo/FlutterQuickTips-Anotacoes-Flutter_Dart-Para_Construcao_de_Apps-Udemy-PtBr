import 'package:flutter/material.dart';
import 'package:projeto_calculator/models/memory.dart';

class Button extends StatelessWidget {
  static const Color defaultColor = Color.fromRGBO(112, 112, 112, 1);
  static const Color operationColor = Color.fromRGBO(250, 158, 13, 1);
  static const Color specialColor = Color.fromRGBO(82, 82, 82, 1);

  final String text;
  final void Function({required dynamic command}) callback;
  final bool big;
  final Color color;

  const Button({
    super.key,
    required this.text,
    required this.callback,
    this.big = false,
    this.color = defaultColor,
  });

  const Button.big({
    super.key,
    required this.text,
    required this.callback,
    this.color = defaultColor,
  }) : big = true;

  const Button.operation({
    super.key,
    required this.text,
    required this.callback,
    this.color = operationColor,
  }) : big = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        onPressed: () => callback(command: _getCommand()),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  dynamic _getCommand() {
    for (Operation operation in Operation.values) {
      if (operation.value == text) {
        return operation;
      }
    }

    return text;
  }
}
