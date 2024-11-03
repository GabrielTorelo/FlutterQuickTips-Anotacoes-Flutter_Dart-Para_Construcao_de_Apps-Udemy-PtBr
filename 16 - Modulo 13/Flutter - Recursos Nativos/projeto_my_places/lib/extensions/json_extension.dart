import 'dart:convert';

extension JsonExtension on String {
  bool isPossibleDecodeJson() {
    try {
      jsonDecode(this) as Map<String, dynamic>;
      return true;
    } catch (_) {
      return false;
    }
  }
}
