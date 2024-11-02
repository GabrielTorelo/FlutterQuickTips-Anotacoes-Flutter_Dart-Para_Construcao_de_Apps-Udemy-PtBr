import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:projeto_pomodoro/components/stopwatch_button.dart';
import 'package:projeto_pomodoro/store/pomodoro.store.dart';

class StopwatchWidget extends StatelessWidget {
  const StopwatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => ColoredBox(
        color: provider.type == PomodoroType.work
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                provider.type == PomodoroType.work
                    ? 'Work Time'
                    : 'Short Break',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '${provider.minutes.toString().padLeft(2, '0')}:${provider.seconds.toString().padLeft(2, '0')}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!provider.isRunning)
                    StopwatchButton(
                      icon: Icons.play_arrow,
                      title: 'Start',
                      onPressed: provider.start,
                    ),
                  if (provider.isRunning)
                    StopwatchButton(
                      icon: Icons.stop,
                      title: 'Stop',
                      onPressed: provider.stop,
                    ),
                  StopwatchButton(
                    icon: Icons.refresh,
                    title: 'Restart',
                    onPressed: provider.restart,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
