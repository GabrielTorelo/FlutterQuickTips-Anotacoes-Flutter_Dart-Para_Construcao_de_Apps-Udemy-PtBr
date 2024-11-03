import 'package:flutter/material.dart';
import 'package:projeto_minesweeper/components/area.dart';
import 'package:projeto_minesweeper/models/area.dart';
import 'package:projeto_minesweeper/models/board.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Area) onOpen;
  final void Function(Area) onToggleMark;

  const BoardWidget({
    super.key,
    required this.board,
    required this.onOpen,
    required this.onToggleMark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.areas.map((area) {
          return AreaWidget(
            area: area,
            onOpen: onOpen,
            onToggleMark: onToggleMark,
          );
        }).toList(),
      ),
    );
  }
}
