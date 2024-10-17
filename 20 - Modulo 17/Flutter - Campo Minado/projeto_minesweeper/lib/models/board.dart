import 'dart:math';
import 'package:projeto_minesweeper/models/area.dart';

class Board {
  final int lines;
  final int columns;
  final int numberOfBombs;
  final List<Area> _areas = [];

  Board({
    required this.lines,
    required this.columns,
    required this.numberOfBombs,
  }) {
    _createAreas();
    _relateNeighbors();
    _drawMines();
  }

  void restart() {
    for (Area area in _areas) {
      area.restart();
    }

    _drawMines();
  }

  void revealBombs() {
    for (Area area in _areas) {
      area.revealBombs();
    }
  }

  void _createAreas() {
    for (int line = 0; line < lines; line++) {
      for (int column = 0; column < columns; column++) {
        _areas.add(Area(line: line, column: column));
      }
    }
  }

  void _relateNeighbors() {
    for (Area area in _areas) {
      for (Area neighbor in _areas) {
        area.addNeighbor(neighbor: neighbor);
      }
    }
  }

  void _drawMines() {
    int drawn = 0;

    if (numberOfBombs > lines * columns) {
      return;
    }

    while (drawn < numberOfBombs) {
      int random = Random().nextInt(_areas.length);

      if (!_areas[random].mined) {
        drawn++;
        _areas[random].mine();
      }
    }
  }

  List<Area> get areas => _areas;

  bool get resolved => _areas.every((area) => area.resolved);
}
