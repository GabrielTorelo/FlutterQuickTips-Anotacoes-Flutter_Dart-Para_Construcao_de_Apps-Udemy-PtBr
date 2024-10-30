import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/components/stopwatch_button.dart';

class StopwatchWidget extends StatelessWidget {
  const StopwatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Work Time',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '25:00',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StopwatchButton(
                  icon: Icons.play_arrow,
                  title: 'Start',
                  onPressed: () {},
                ),
                // StopwatchButton(
                //   icon: Icons.stop,
                //   title: 'Stop',
                //   onPressed: () {},
                // ),
                StopwatchButton(
                  icon: Icons.refresh,
                  title: 'Restart',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
