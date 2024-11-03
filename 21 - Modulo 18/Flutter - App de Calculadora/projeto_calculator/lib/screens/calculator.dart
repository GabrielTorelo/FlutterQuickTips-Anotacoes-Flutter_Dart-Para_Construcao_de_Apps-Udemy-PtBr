import 'package:flutter/material.dart';
import 'package:projeto_calculator/components/display.dart';
import 'package:projeto_calculator/components/keyboard.dart';
import 'package:projeto_calculator/models/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  void _onPressed({required dynamic command}) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Display(
            text: memory.value,
          ),
          Keyboard(
            callback: _onPressed,
          ),
        ],
      ),
    );
  }
}
