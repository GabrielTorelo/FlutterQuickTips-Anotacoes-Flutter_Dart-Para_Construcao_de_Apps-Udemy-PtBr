import 'package:projeto_minesweeper/err/explosion_exception.dart';

class Area {
  final int line;
  final int column;
  final List<Area> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Area({required this.line, required this.column});

  void addNeighbor({required Area neighbor}) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mined) {
      _exploded = true;

      throw ExplosionException();
    }

    if (safeNeighborhood) {
      for (var neighbor in neighbors) {
        neighbor.open();
      }
    }
  }

  void revealBombs() {
    if (_mined) {
      _opened = true;
    }
  }

  void mine() {
    _mined = true;
  }

  void toggleMarked() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined => _mined;
  bool get exploded => _exploded;
  bool get opened => _opened;
  bool get marked => _marked;
  bool get resolved => mined && marked || !mined && opened;
  bool get safeNeighborhood => neighbors.every((neighbor) => !neighbor.mined);
  int get numberOfMines => neighbors.where((neighbor) => neighbor.mined).length;
}
