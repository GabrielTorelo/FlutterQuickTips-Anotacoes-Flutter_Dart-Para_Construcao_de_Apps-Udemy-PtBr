import 'package:flutter/material.dart';
import 'package:projeto_calculator/components/button.dart';
import 'package:projeto_calculator/components/button_row.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) callback;

  const Keyboard({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          ButtonRow(
            buttons: [
              Button.big(
                text: 'AC',
                callback: callback,
                color: Button.specialColor,
              ),
              Button(
                text: '%',
                callback: callback,
                color: Button.specialColor,
              ),
              Button.operation(
                text: '/',
                callback: callback,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button(
                text: '7',
                callback: callback,
              ),
              Button(
                text: '8',
                callback: callback,
              ),
              Button(
                text: '9',
                callback: callback,
              ),
              Button.operation(
                text: 'x',
                callback: callback,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button(
                text: '4',
                callback: callback,
              ),
              Button(
                text: '5',
                callback: callback,
              ),
              Button(
                text: '6',
                callback: callback,
              ),
              Button.operation(
                text: '-',
                callback: callback,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button(
                text: '1',
                callback: callback,
              ),
              Button(
                text: '2',
                callback: callback,
              ),
              Button(
                text: '3',
                callback: callback,
              ),
              Button.operation(
                text: '+',
                callback: callback,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button.big(
                text: '0',
                callback: callback,
              ),
              Button(
                text: '.',
                callback: callback,
              ),
              Button.operation(
                text: '=',
                callback: callback,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
