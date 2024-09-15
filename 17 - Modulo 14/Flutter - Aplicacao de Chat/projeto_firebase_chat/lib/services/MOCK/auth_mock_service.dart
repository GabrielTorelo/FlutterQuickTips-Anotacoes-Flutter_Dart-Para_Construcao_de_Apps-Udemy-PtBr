import 'dart:io';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get onAuthStateChanged => Stream.value(null);

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    return;
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    return;
  }

  @override
  Future<void> logout() async {
    return;
  }
}
