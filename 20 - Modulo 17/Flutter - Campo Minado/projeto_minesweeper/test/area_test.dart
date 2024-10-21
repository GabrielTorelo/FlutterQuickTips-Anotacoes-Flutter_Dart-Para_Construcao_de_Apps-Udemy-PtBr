import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_minesweeper/models/area.dart';

void main() {
  group('Area', () {
    test('Open field with explosion', () {
      Area area = Area(line: 0, column: 0);

      area.mine();

      expect(area.open, throwsException);
    });

    test('Open field without explosion', () {
      Area area = Area(line: 0, column: 0);

      area.open();

      expect(area.opened, isTrue);
    });

    test('Add non-neighbor', () {
      Area area1 = Area(line: 0, column: 0);
      Area area2 = Area(line: 1, column: 3);

      area1.addNeighbor(neighbor: area2);

      expect(area1.neighbors.isEmpty, isTrue);
    });

    test('Add neighbor', () {
      Area area1 = Area(line: 3, column: 3);
      Area area2 = Area(line: 3, column: 4);
      Area area3 = Area(line: 2, column: 2);
      Area area4 = Area(line: 4, column: 4);

      area1.addNeighbor(neighbor: area2);
      area1.addNeighbor(neighbor: area3);
      area1.addNeighbor(neighbor: area4);

      expect(area1.neighbors.length, 3);
    });

    test('Mines in the neighborhood', () {
      Area area1 = Area(line: 3, column: 3);
      Area area2 = Area(line: 3, column: 4);
      Area area3 = Area(line: 2, column: 2);
      Area area4 = Area(line: 4, column: 4);

      area2.mine();
      area4.mine();

      area1.addNeighbor(neighbor: area2);
      area1.addNeighbor(neighbor: area3);
      area1.addNeighbor(neighbor: area4);

      expect(area1.numberOfMines, 2);
    });
  });
}
