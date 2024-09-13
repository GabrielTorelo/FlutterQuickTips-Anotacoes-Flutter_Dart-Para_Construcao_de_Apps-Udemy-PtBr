import 'dart:io';

class Auth {
  String? nickname;
  String? email;
  String? password;
  File? image;
  AuthMode _mode = AuthMode.login;

  void toggleMode() {
    _mode = isLogin ? AuthMode.signup : AuthMode.login;
  }

  bool get isLogin {
    return _mode == AuthMode.login;
  }

  bool get isSignup {
    return _mode == AuthMode.signup;
  }
}

enum AuthMode {
  signup,
  login,
}
