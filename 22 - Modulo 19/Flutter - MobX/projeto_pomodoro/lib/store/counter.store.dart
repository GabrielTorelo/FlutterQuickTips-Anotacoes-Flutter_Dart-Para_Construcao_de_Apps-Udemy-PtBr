import 'package:mobx/mobx.dart';

// Rode o comando abaixo para gerar o arquivo counter.store.g.dart
// flutter pub run build_runner build

part 'counter.store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int _counter = 0;

  int get counter => _counter;

  @action
  void increment() {
    _counter++;
  }
}
