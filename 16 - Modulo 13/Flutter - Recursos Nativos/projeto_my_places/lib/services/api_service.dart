import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_my_places/extensions/json_extension.dart';

class ApiService {
  final Map<String, String>? headers;

  ApiService({
    this.headers,
  });

  Future<Map<String, dynamic>> _makeRequest({
    required String method,
    required String path,
    Map<String, dynamic>? body,
    bool withResponse = true,
  }) async {
    final Map<String, String> header = {
      ...headers ?? {},
      "Content-Type": "application/json",
    };

    final request = http.Request(
      method,
      Uri.parse(path),
    )..headers.addAll(header);

    if (method != 'GET') {
      request.body = jsonEncode(body);
    }

    return await http.Client().send(request).then(
      (response) async {
        final responseBody = await response.stream.bytesToString();

        return withResponse
            ? responseBody.isPossibleDecodeJson()
                ? jsonDecode(responseBody)
                : {"error": responseBody}
            : {"status": response.statusCode};
      },
    ).catchError(
      (error) => {"error": error.toString()},
    );
  }

  Future<Map<String, dynamic>> methodGET({
    required String path,
  }) async {
    return await _makeRequest(
      method: 'GET',
      path: path,
    );
  }

  Future<Map<String, dynamic>> methodPOST({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await _makeRequest(
      method: 'POST',
      path: path,
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
      path: path,
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
      path: path,
      body: data,
    );
  }

  Future<Map<String, dynamic>> methodDELETE({
    required String path,
    required String id,
  }) async {
    return await _makeRequest(
      method: 'DELETE',
      path: path,
      withResponse: false,
    );
  }
}
