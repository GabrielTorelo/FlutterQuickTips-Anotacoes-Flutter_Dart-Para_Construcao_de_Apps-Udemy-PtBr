import 'dart:async';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/models/message.dart';
import 'package:projeto_firebase_chat/services/chat/chat_service.dart';
import 'package:uuid/uuid.dart';

class ChatMockService implements ChatService {
  static final List<Message> _messages = [];
  static final StreamController<List<Message>> _messagesStreamController =
      StreamController<List<Message>>.broadcast(
    onListen: () {
      _messagesStreamController.add(_messages);
    },
  );
  static final List<Message> _mockMessages = [
    Message(
      id: const Uuid().v4(),
      text: 'Olá, tudo bem?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
      userId: '123',
      userName: 'Gabriel Torelo',
      userImagePath: 'assets/images/avatar.png',
    ),
    Message(
      id: const Uuid().v4(),
      text: 'Tudo ótimo e você?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      userId: '321',
      userName: 'Maria',
      userImagePath: 'assets/images/avatar.png',
    ),
    Message(
      id: const Uuid().v4(),
      text: 'Estou bem também, obrigado!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Gabriel Torelo',
      userImagePath: 'assets/images/avatar.png',
    ),
  ];

  ChatMockService() {
    if (_messages.isEmpty) _messages.addAll(_mockMessages.reversed);
  }

  @override
  Stream<List<Message>?> getMessages() => _messagesStreamController.stream;

  @override
  Future<Message> save({required String message, required ChatUser user}) {
    final newMessage = Message(
      id: const Uuid().v4(),
      text: message,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImagePath: user.imagePath ?? 'assets/images/avatar.png',
    );

    _messages.add(newMessage);
    _messagesStreamController.add(_messages.reversed.toList());

    return Future.value(newMessage);
  }
}
