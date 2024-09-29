import 'package:projeto_firebase_chat/services/MOCK/auth_mock_service.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';
import 'package:projeto_firebase_chat/services/firebase/auth_firebase_service.dart';

class AuthFactoryService {
  static AuthService createAuthService({bool useMock = true}) {
    if (useMock) {
      return AuthMockService();
    } else {
      return AuthFirebaseService();
    }
  }
}
