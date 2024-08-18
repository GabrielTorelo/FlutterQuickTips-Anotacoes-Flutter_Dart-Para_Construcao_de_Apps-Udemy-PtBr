import 'package:flutter/material.dart';
import 'package:shop/exceptions/auth_exception.dart';
import 'package:shop/services/firebase_service.dart';

class Auth with ChangeNotifier {
  final FirebaseService _firebase = FirebaseService();
  String? _token;
  String? _email;
  String? _userId;
  DateTime? _expiryDate;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get userId {
    return isAuth ? _userId : null;
  }

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

    _token = response['idToken'];
    _email = response['email'];
    _userId = response['localId'];
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(response['expiresIn']),
      ),
    );

    notifyListeners();
  }
}

enum AuthMode {
  signup,
  login,
}
