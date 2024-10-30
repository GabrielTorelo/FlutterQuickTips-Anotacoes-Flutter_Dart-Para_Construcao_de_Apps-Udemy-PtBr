import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/components/entry_time.dart';
import 'package:projeto_pomodoro/components/stopwatch.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StopwatchWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EntryTime(
                  title: 'Work',
                  value: 25,
                ),
                EntryTime(
                  title: 'Short Break',
                  value: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
