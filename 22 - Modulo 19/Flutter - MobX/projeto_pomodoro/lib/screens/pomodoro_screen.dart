import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/components/entry_time_item.dart';
import 'package:projeto_pomodoro/components/stopwatch.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: isLandScape
          ? const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: StopwatchWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: EntryTimeItem(),
                  ),
                ),
              ],
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: StopwatchWidget(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: EntryTimeItem(),
                ),
              ],
            ),
    );
  }
}
