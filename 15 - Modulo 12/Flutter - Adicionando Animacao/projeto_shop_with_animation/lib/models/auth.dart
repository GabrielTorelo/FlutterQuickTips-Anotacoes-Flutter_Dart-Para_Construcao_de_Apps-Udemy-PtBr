import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/data/store.dart';
import 'package:shop/exceptions/auth_exception.dart';
import 'package:shop/services/firebase_service.dart';

class Auth with ChangeNotifier {
  final Store _store = Store();
  final FirebaseService _firebase = FirebaseService();
  String? _token;
  String? _email;
  String? _userId;
  DateTime? _expiryDate;
  Timer? _logoutTimer;

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

    _store.saveMultiple(
      key: 'userData',
      value: {
        'token': _token,
        'email': _email,
        'userId': _userId,
        'expiryDate': _expiryDate?.toIso8601String() ??
            DateTime.now().add(const Duration(seconds: 3600)).toIso8601String(),
      },
    );

    _autoLogout();

    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) return;

    final userData = await _store.readMultiple(key: 'userData');

    if (userData.isEmpty ||
        !userData.containsKey('token') ||
        !userData.containsKey('email') ||
        !userData.containsKey('userId') ||
        !userData.containsKey('expiryDate')) return;

    final expiryDate = DateTime.parse(userData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) return;

    _token = userData['token'];
    _email = userData['email'];
    _userId = userData['userId'];
    _expiryDate = expiryDate;

    _autoLogout();

    notifyListeners();
  }

  void logout() {
    _token = null;
    _email = null;
    _userId = null;
    _expiryDate = null;

    _clearLogoutTimer();

    _store.delete(key: 'userData').then((_) => notifyListeners());
  }

  void _clearLogoutTimer() {
    if (_logoutTimer != null) {
      _logoutTimer = null;
      _logoutTimer?.cancel();
    }
  }

  void _autoLogout() {
    final timeToLogout = _expiryDate?.difference(DateTime.now()).inSeconds;

    _clearLogoutTimer();

    _logoutTimer = Timer(
      Duration(seconds: timeToLogout ?? 0),
      logout,
    );
  }
}

enum AuthMode {
  signup,
  login,
}
