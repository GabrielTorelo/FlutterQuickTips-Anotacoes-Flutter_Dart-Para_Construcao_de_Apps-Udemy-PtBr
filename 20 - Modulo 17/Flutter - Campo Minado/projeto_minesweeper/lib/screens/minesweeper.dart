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
  Board? _board;

  void _restartGame() {
    setState(() {
      _win = null;
      _board!.restart();
    });
  }

  void onOpen(Area area) {
    if (_win != null) {
      return;
    }

    setState(() {
      try {
        area.open();

        if (_board != null && _board!.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board!.revealBombs();
      }
    });
  }

  void onToggleMark(Area area) {
    if (_win != null) {
      return;
    }

    setState(() {
      area.toggleMarked();

      if (_board != null && _board!.resolved) {
        _win = true;
      }
    });
  }

  Board _getBoard({
    required double width,
    required double height,
  }) {
    if (_board == null) {
      int numColumns = 15;
      double sizeBoard = width / numColumns;
      int numLines = (height / sizeBoard).floor();

      _board = Board(
        lines: numLines,
        columns: numColumns,
        numberOfBombs: 50,
      );
    }

    return _board!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        win: _win,
        onRestart: _restartGame,
      ),
      body: SizedBox(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return BoardWidget(
              board: _getBoard(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              ),
              onOpen: onOpen,
              onToggleMark: onToggleMark,
            );
          },
        ),
      ),
    );
  }
}
