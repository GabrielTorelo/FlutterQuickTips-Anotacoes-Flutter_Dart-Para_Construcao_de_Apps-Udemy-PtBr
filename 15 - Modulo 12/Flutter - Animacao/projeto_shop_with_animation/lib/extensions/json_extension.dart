import 'dart:convert';

extension JsonExtension on String {
  bool tryJsonDecode() {
    try {
      jsonDecode(this) as Map<String, dynamic>;
      return true;
    } catch (_) {
      return false;
    }
  }
}
