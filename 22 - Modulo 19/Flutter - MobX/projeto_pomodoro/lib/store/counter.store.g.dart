// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on _CounterStore, Store {
  late final _$_counterAtom =
      Atom(name: '_CounterStore._counter', context: context);

  @override
  int get _counter {
    _$_counterAtom.reportRead();
    return super._counter;
  }

  @override
  set _counter(int value) {
    _$_counterAtom.reportWrite(value, super._counter, () {
      super._counter = value;
    });
  }

  late final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
