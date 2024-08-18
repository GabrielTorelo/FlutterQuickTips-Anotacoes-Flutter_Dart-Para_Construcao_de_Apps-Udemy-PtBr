class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Email already registered!',
    'EMAIL_NOT_FOUND': 'User not found!',
    'INVALID_LOGIN_CREDENTIALS': 'Invalid login credentials!',
    'INVALID_PASSWORD': 'Invalid password!',
    'USER_DISABLED': 'User deactivated, contact support for more information.',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Many attempts, try later!',
    'OPERATION_NOT_ALLOWED': 'Operation not permitted!',
  };

  final String errorMenssage;

  AuthException({required this.errorMenssage});

  @override
  String toString() {
    return errors[errorMenssage].toString();
  }
}
