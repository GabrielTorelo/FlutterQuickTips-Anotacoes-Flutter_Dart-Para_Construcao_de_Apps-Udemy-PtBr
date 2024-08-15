import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FirebaseService {
  FirebaseRequest? _requestType;
  final Map<String, String>? headers;

  FirebaseService({
    FirebaseRequest? requestType,
    this.headers,
  }) : _requestType = requestType;

  set requestType(FirebaseRequest request) {
    _requestType = request;
  }

  String get _firebaseURL {
    return switch (_requestType) {
      FirebaseRequest.authSignUp => _firebaseSignupURL,
      FirebaseRequest.authSignIn => _firebaseSigninURL,
      _ => _firebaseRealtimeURL,
    };
  }

  String get _firebaseRealtimeURL =>
      dotenv.env['FIREBASE_REALTIME_DB'] ?? 'http://localhost:3000';

  String get _firebaseSignupURL =>
      dotenv.env['FIREBASE_AUTH_SIGNUP'] ?? 'http://localhost:3000';

  String get _firebaseSigninURL =>
      dotenv.env['FIREBASE_AUTH_SIGNIN'] ?? 'http://localhost:3000';

  Future<Map<String, dynamic>> _makeRequest({
    required String method,
    String? path,
    Map<String, dynamic>? body,
    bool withResponse = true,
  }) async {
    final requestPath = (path != null ? '$_firebaseURL/$path' : _firebaseURL);

    final Map<String, String> header = {
      ...headers ?? {},
      "Content-Type": "application/json",
    };

    final request = http.Request(
      method,
      Uri.parse(requestPath),
    )
      ..headers.addAll(header)
      ..body = jsonEncode(body ?? {});

    return await http.Client()
        .send(request)
        .then(
          (response) async => withResponse
              ? jsonDecode(await response.stream.bytesToString())
              : {"status": response.statusCode},
        )
        .catchError(
          (error) => {"error": error.toString()},
        );
  }

  Future<Map<String, dynamic>> methodGET({
    required String path,
  }) async {
    return await _makeRequest(
      method: 'GET',
      path: '$path.json',
    );
  }

  Future<Map<String, dynamic>> methodPOST({
    String? path,
    required Map<String, dynamic> data,
  }) async {
    final requestPath = (path != null ? '$path.json' : null);

    return await _makeRequest(
      method: 'POST',
      path: requestPath,
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodPUT({
    String? path,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final requestPath = (path != null ? '$path/$id.json' : null);

    return await _makeRequest(
      method: 'PUT',
      path: requestPath,
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodPATCH({
    String? path,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final requestPath = (path != null ? '$path/$id.json' : null);

    return await _makeRequest(
      method: 'PATCH',
      path: requestPath,
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodDELETE({
    String? path,
    required String id,
  }) async {
    final requestPath = (path != null ? '$path/$id.json' : null);

    return await _makeRequest(
      method: 'DELETE',
      path: requestPath,
      withResponse: false,
    );
  }
}

enum FirebaseRequest {
  realtimeDB,
  authSignUp,
  authSignIn,
}
