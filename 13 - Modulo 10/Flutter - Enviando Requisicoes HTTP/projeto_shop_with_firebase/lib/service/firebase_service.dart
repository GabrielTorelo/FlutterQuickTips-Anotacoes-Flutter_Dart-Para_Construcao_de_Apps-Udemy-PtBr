import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FirebaseService {
  String get _firebaseURL =>
      dotenv.env['FIREBASE_URL'] ?? 'http://localhost:3000';

  Future<Map<String, dynamic>> methodGET({required String path}) async {
    final response = await http.get(Uri.parse("$_firebaseURL/$path.json"));
    return jsonDecode(response.body);
  }

  void methodPOST({required String path, required Map<String, dynamic> data}) {
    http.post(
      Uri.parse("$_firebaseURL/$path.json"),
      body: jsonEncode(data),
    );
  }

  void methodPUT({required String path, required Map<String, dynamic> data}) {
    http.put(
      Uri.parse("$_firebaseURL/$path.json"),
      body: jsonEncode(data),
    );
  }

  void methodDELETE({required String path}) {
    http.delete(
      Uri.parse("$_firebaseURL/$path.json"),
    );
  }
}
