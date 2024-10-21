import 'package:flutter/material.dart';
import 'package:projeto_minesweeper/components/result.dart';
import 'package:projeto_minesweeper/models/area.dart';

class Minesweeper extends StatelessWidget {
  const Minesweeper({super.key});

  void _restartGame() {
    print('Restarting game...');
  }

  void onOpen(Area area) {
    print('Opening area...');
  }

  void onToggleMark(Area area) {
    print('Toggling mark...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        win: null,
        onRestart: _restartGame,
      ),
      body: const Center(
        child: Text(
          'Minesweeper',
        ),
      ),
    );
  }
}
