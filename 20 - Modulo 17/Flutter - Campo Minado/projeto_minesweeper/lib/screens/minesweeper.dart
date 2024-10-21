import 'package:flutter/material.dart';
import 'package:projeto_minesweeper/components/board.dart';
import 'package:projeto_minesweeper/components/result.dart';
import 'package:projeto_minesweeper/err/explosion_exception.dart';
import 'package:projeto_minesweeper/models/area.dart';
import 'package:projeto_minesweeper/models/board.dart';

class Minesweeper extends StatefulWidget {
  const Minesweeper({super.key});

  @override
  State<Minesweeper> createState() => _MinesweeperState();
}

class _MinesweeperState extends State<Minesweeper> {
  bool? _win;
  final Board _board = Board(
    lines: 12,
    columns: 12,
    numberOfBombs: 3,
  );

  void _restartGame() {
    setState(() {
      _win = null;
      _board.restart();
    });
  }

  void onOpen(Area area) {
    if (_win != null) {
      return;
    }

    setState(() {
      try {
        area.open();

        if (_board.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board.revealBombs();
      }
    });
  }

  void onToggleMark(Area area) {
    if (_win != null) {
      return;
    }

    setState(() {
      area.toggleMarked();

      if (_board.resolved) {
        _win = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        win: _win,
        onRestart: _restartGame,
      ),
      body: SizedBox(
        child: BoardWidget(
          board: _board,
          onOpen: onOpen,
          onToggleMark: onToggleMark,
        ),
      ),
    );
  }
}
