class Memory {
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  Operation? _operation;
  String _value = '0';
  bool _wipeValue = false;
  dynamic _lastCommand;

  void applyCommand(dynamic command) {
    if (command is Operation) {
      if (_isReplaceOperation(command)) {
        _operation = command;
        return;
      }

      if (command == Operation.clear) {
        _allClear();
      } else {
        _setOperation(operation: command);
      }
    } else if (command is String) {
      _addDigit(digit: command);
    } else {
      throw ArgumentError('Invalid command');
    }

    _lastCommand = command;
  }

  bool _isReplaceOperation(Operation operation) =>
      _lastCommand is Operation &&
      _lastCommand != Operation.equal &&
      operation != Operation.clear &&
      operation != Operation.equal;

  void _setOperation({required Operation operation}) {
    final bool isEqual = operation == Operation.equal;

    if (_bufferIndex == 0) {
      if (!isEqual) {
        _bufferIndex = 1;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
    }

    if (isEqual) {
      _operation = null;
      _bufferIndex = 0;
    } else {
      _operation = operation;
    }

    _wipeValue = true;
    _value = _buffer[0].toString();
    _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
  }

  void _addDigit({required String digit}) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && digit != '.') || _wipeValue;

    if (wipeValue) {
      _value = '';
    }

    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    if (isDot && _value.isEmpty) {
      _value = '0';
    }

    _value += digit;
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    _wipeValue = false;
  }

  double _calculate() {
    if (_operation != null) {
      return switch (_operation) {
        Operation.module => _buffer[0] % _buffer[1],
        Operation.divide => _buffer[1] == 0 ? 0 : _buffer[0] / _buffer[1],
        Operation.multiply => _buffer[0] * _buffer[1],
        Operation.subtract => _buffer[0] - _buffer[1],
        Operation.add => _buffer[0] + _buffer[1],
        _ => _buffer[0],
      };
    }

    return _buffer[0];
  }

  void _allClear() {
    _value = '0';
    _operation = null;
    _wipeValue = false;
    _bufferIndex = 0;
    _buffer.setAll(0, [0.0, 0.0]);
  }

  String get value => _value;
}

enum Operation {
  clear('AC'),
  module('%'),
  divide('/'),
  multiply('x'),
  subtract('-'),
  add('+'),
  equal('=');

  final String value;
  const Operation(this.value);

  String call() => value.toString();
}
