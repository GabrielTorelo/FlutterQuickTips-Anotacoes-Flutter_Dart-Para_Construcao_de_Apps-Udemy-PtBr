import 'package:flutter/material.dart';

class CounterState {
  int _value = 0;

  void increment() => _value++;

  void decrement() {
    if (_value > 0) _value--;
  }

  bool diff(CounterState old) => old._value != _value;

  int get value => _value;
}

class CounterProvider extends InheritedWidget {
  final CounterState state = CounterState();

  CounterProvider({
    super.key,
    required super.child,
  });

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}
