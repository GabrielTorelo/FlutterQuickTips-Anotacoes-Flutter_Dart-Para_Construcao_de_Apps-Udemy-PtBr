import 'dart:async';
import 'package:projeto_firebase_chat/models/auth.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';
import 'package:uuid/uuid.dart';

class AuthMockService implements AuthService {
  static final Map<String, ChatUserMock> _users = {};
  static ChatUserMock? _currentUser;
  static final StreamController<ChatUserMock?> _userStreamController =
      StreamController<ChatUserMock?>.broadcast(
    onListen: () {
      _userStreamController.add(_currentUser);
    },
  );
  static final ChatUserMock _mockUser = ChatUserMock(
    id: '123',
    name: 'Gabriel Torelo',
    email: 'admin@teste.com',
    password: '123456',
    imagePath: 'assets/images/avatar.png',
  );

  AuthMockService() {
    _users.putIfAbsent(_mockUser.email, () => _mockUser);
  }

  static void _updateCurrentUser(ChatUserMock? user) {
    _currentUser = user;
    _userStreamController.add(_currentUser);
  }

  @override
  ChatUserMock? get currentUser => _currentUser;

  @override
  Stream<ChatUserMock?> get onAuthStateChanged => _userStreamController.stream;

  @override
  Future<void> login(Auth auth) async {
    final user = _users.values.firstWhere(
      (user) => user.email == auth.email && user.password == auth.password,
      orElse: () => throw Exception('User not found'),
    );
    _updateCurrentUser(user);
  }

  @override
  Future<void> register(Auth auth) async {
    final newUser = ChatUserMock(
      id: const Uuid().v4(),
      name: auth.nickname,
      email: auth.email,
      password: auth.password,
      imagePath: auth.image!.path,
    );
    _users.putIfAbsent(auth.email, () => newUser);
    _updateCurrentUser(newUser);
  }

  @override
  Future<void> logout() async {
    _updateCurrentUser(null);
  }
}

class ChatUserMock extends ChatUser {
  final String password;

  ChatUserMock({
    required super.id,
    required super.name,
    required super.email,
    required this.password,
    required super.imagePath,
  });
}
