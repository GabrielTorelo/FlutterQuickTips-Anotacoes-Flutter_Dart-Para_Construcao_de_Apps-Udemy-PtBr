import 'package:projeto_firebase_chat/models/auth.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/services/auth/auth_factory_service.dart';

abstract class AuthService {
  ChatUser? get currentUser;
  Stream<ChatUser?> get onAuthStateChanged;

  Future<void> login(Auth auth);
  Future<void> register(Auth auth);
  Future<void> logout();

  factory AuthService() {
    // --------------------------------------------------------------------
    // Define se serão utilizados os dados Mockados ou os dados do Firebase
    // --------------------------------------------------------------------
    //
    // useMock: true => Serão utilizados os dados Mockados
    // useMock: false => Serão utilizados os dados do Firebase
    //
    return AuthFactoryService.createAuthService(
      useMock: true,
    );
  }
}
