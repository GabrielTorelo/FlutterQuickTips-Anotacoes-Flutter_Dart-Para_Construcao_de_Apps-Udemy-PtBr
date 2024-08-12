import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FirebaseService {
  final Map<String, String>? headers;

  const FirebaseService({
    this.headers,
  });

  String get _firebaseURL =>
      dotenv.env['FIREBASE_URL'] ?? 'http://localhost:3000';

  Future<Map<String, dynamic>> _makeRequest({
    required String method,
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final Map<String, String> header = {
      ...headers ?? {},
      "Content-Type": "application/json",
    };

    final request = http.Request(
      method,
      Uri.parse("$_firebaseURL/$path"),
    )
      ..headers.addAll(header)
      ..body = jsonEncode(body ?? {});

    return await http.Client()
        .send(request)
        .then(
          (response) async => jsonDecode(await response.stream.bytesToString()),
        )
        .catchError(
          (error) => {"error": error.toString()},
        );
  }

  Future<Map<String, dynamic>> methodGET({required String path}) async {
    return await _makeRequest(
      method: 'GET',
      path: '$path.json',
    );
  }

  Future<Map<String, dynamic>> methodPOST({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await _makeRequest(
      method: 'POST',
      path: '$path.json',
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodPUT({
    required String path,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    return await _makeRequest(
      method: 'PUT',
      path: '$path/$id.json',
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodPATCH({
    required String path,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    return await _makeRequest(
      method: 'PATCH',
      path: '$path/$id.json',
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodDELETE({
    required String path,
  }) async {
    return await _makeRequest(
      method: 'DELETE',
      path: '$path.json',
    );
  }
}
