import 'package:flutter/material.dart';
import 'package:shop/exceptions/auth_exception.dart';
import 'package:shop/services/firebase_service.dart';

class Auth with ChangeNotifier {
  final FirebaseService _firebase = FirebaseService();

  Future<void> authentication({
    required String email,
    required String password,
    required AuthMode authMode,
  }) async {
    authMode == AuthMode.signup
        ? _firebase.requestType = FirebaseRequest.authSignUp
        : _firebase.requestType = FirebaseRequest.authSignIn;

    final response = await _firebase.methodPOST(
      data: {
        "email": email.toString(),
        "password": password.toString(),
        "returnSecureToken": true,
      },
    );

    if (response.containsKey('error')) {
      String errorMessage = response['error']['message'];
      throw AuthException(errorMenssage: errorMessage.split(':').first.trim());
    }
  }
}

enum AuthMode {
  signup,
  login,
}
