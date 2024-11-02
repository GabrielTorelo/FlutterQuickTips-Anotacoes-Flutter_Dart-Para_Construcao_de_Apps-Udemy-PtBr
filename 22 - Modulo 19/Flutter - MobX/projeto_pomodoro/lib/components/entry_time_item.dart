import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_pomodoro/store/pomodoro.store.dart';
import 'package:projeto_pomodoro/components/entry_time.dart';

class EntryTimeItem extends StatelessWidget {
  const EntryTimeItem({super.key});

  List<Widget> _entryTimeWidgets(PomodoroStore provider) {
    return [
      EntryTime(
        title: 'Work',
        value: provider.workingTime,
        onIncrementPressed: provider.isRunning && provider.isWorkTime
            ? null
            : provider.incrementWorkingTime,
        onDecrementPressed: provider.isRunning && provider.isWorkTime
            ? null
            : provider.decrementWorkingTime,
      ),
      EntryTime(
        title: 'Short Break',
        value: provider.breakTime,
        onIncrementPressed: provider.isRunning && provider.isShortBreakTime
            ? null
            : provider.incrementBreakTime,
        onDecrementPressed: provider.isRunning && provider.isShortBreakTime
            ? null
            : provider.decrementBreakTime,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PomodoroStore>(context);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Observer(
      builder: (_) => isLandScape
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _entryTimeWidgets(provider),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _entryTimeWidgets(provider),
            ),
    );
  }
}
