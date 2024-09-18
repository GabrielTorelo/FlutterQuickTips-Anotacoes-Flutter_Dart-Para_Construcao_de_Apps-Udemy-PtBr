import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_firebase_chat/models/auth.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class AuthFirebaseService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static ChatUser? _currentUser;
  static final Stream<ChatUser?> _userStreamController =
      Stream<ChatUser?>.multi(
    (controller) async {
      final authChanges = FirebaseAuth.instance.authStateChanges();

      await for (final User? user in authChanges) {
        _currentUser = _getUser(user);
        controller.add(_currentUser);
      }
    },
  );

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get onAuthStateChanged => _userStreamController;

  @override
  Future<void> login(Auth auth) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: auth.email,
      password: auth.password,
    );
  }

  @override
  Future<void> register(Auth auth) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: auth.email,
      password: auth.password,
    );

    final user = userCredential.user;

    if (user == null) throw Exception('User not found');

    user.updateDisplayName(auth.nickname);
    // user.updatePhotoURL(auth.image!.path);

    _currentUser = ChatUser(
      id: user.uid,
      name: auth.nickname,
      email: auth.email,
      imagePath: auth.image!.path,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  static ChatUser? _getUser(User? user) {
    if (user == null) return null;

    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@').first,
      email: user.email!,
      imagePath: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
