import 'package:flutter/material.dart';
import 'package:projeto_minesweeper/models/area.dart';

class AreaWidget extends StatelessWidget {
  final Area area;
  final void Function(Area) onOpen;
  final void Function(Area) onToggleMark;

  const AreaWidget({
    super.key,
    required this.area,
    required this.onOpen,
    required this.onToggleMark,
  });

  Widget _getImage() {
    int numberOfMines = area.numberOfMines;

    if (area.opened && area.mined && area.exploded) {
      return Image.asset('assets/images/bomb_0.jpeg');
    } else if (area.opened && area.mined) {
      return Image.asset('assets/images/bomb_1.jpeg');
    } else if (area.opened) {
      return Image.asset('assets/images/open_$numberOfMines.jpeg');
    } else if (area.marked) {
      return Image.asset('assets/images/flag.jpeg');
    } else {
      return Image.asset('assets/images/closed.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(area),
      onLongPress: () => onToggleMark(area),
      child: _getImage(),
    );
  }
}
