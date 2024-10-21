import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_minesweeper/models/board.dart';

void main() {
  test('Win game', () {
    Board board = Board(
      lines: 2,
      columns: 2,
      numberOfBombs: 0,
    );

    board.areas[0].mine();
    board.areas[3].mine();

    board.areas[0].toggleMarked();
    board.areas[1].open();
    board.areas[2].open();
    board.areas[3].toggleMarked();

    expect(board.resolved, isTrue);
  });
}
