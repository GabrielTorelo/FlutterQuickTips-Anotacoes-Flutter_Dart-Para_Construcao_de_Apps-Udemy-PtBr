import 'dart:io';
import 'package:projeto_firebase_chat/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get onAuthStateChanged;

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required File image,
  });

  Future<void> logout();
}
