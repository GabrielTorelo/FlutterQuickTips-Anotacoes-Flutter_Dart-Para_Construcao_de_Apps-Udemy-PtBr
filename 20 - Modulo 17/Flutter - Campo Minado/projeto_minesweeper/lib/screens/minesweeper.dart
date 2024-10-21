import 'package:flutter/material.dart';
import 'package:projeto_minesweeper/components/area.dart';
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
    Area neighbor1 = Area(
      line: 1,
      column: 0,
    );
    neighbor1.mine();

    Area area = Area(
      line: 0,
      column: 0,
    );
    area.addNeighbor(neighbor: neighbor1);
    // area.open();
    area.toggleMarked();

    return Scaffold(
      appBar: ResultWidget(
        win: null,
        onRestart: _restartGame,
      ),
      body: SizedBox(
        child: AreaWidget(
          area: area,
          onOpen: onOpen,
          onToggleMark: onToggleMark,
        ),
      ),
    );
  }
}
