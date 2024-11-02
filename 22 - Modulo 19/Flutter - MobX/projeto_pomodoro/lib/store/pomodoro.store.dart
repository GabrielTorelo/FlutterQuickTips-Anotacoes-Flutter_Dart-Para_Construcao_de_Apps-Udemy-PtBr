import 'dart:async';
import 'package:mobx/mobx.dart';

// Rode o comando abaixo para gerar o arquivo pomodoro.store.g.dart
// flutter pub run build_runner build

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum PomodoroType { work, shortBreak }

abstract class _PomodoroStore with Store {
  @observable
  bool isRunning = false;

  @observable
  int minutes = 1;

  @observable
  int seconds = 0;

  @observable
  int workingTime = 1;

  @observable
  int breakTime = 1;

  @observable
  PomodoroType type = PomodoroType.work;

  Timer? _timer;

  @action
  void start() {
    isRunning = true;

    /* Cada segundo */
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _tick(),
    );

    /* Alterado para 125ms para testes */
    // _timer = Timer.periodic(
    //   const Duration(milliseconds: 125),
    //   (_) => _tick(),
    // );
  }

  @action
  void stop() {
    isRunning = false;
    _timer?.cancel();
  }

  @action
  void restart() {
    final wasRunning = isRunning;

    stop();

    if (type == PomodoroType.work) {
      minutes = workingTime;
    } else {
      minutes = breakTime;
    }

    seconds = 0;

    if (wasRunning) {
      start();
    }
  }

  @action
  void incrementWorkingTime() {
    if (workingTime < 50) {
      workingTime++;
    }

    if (isWorkTime) {
      restart();
    }
  }

  @action
  void decrementWorkingTime() {
    if (workingTime > 1) {
      workingTime--;
    }

    if (isWorkTime) {
      restart();
    }
  }

  @action
  void incrementBreakTime() {
    if (breakTime < 30) {
      breakTime++;
    }

    if (isShortBreakTime) {
      restart();
    }
  }

  @action
  void decrementBreakTime() {
    if (breakTime > 1) {
      breakTime--;
    }

    if (isShortBreakTime) {
      restart();
    }
  }

  void _tick() {
    if (seconds > 0) {
      seconds--;
    } else if (minutes > 0) {
      seconds = 59;
      minutes--;
    } else {
      _switchType();
    }
  }

  void _switchType() {
    if (isWorkTime) {
      type = PomodoroType.shortBreak;
      minutes = breakTime;
    } else {
      type = PomodoroType.work;
      minutes = workingTime;
    }

    seconds = 0;
  }

  bool get isWorkTime => type == PomodoroType.work;

  bool get isShortBreakTime => type == PomodoroType.shortBreak;
}
