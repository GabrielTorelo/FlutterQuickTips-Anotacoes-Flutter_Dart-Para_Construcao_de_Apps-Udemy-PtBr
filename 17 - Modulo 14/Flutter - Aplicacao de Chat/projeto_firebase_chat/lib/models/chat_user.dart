import 'package:uuid/uuid.dart';
import 'package:projeto_firebase_chat/models/message.dart';

class ChatUser {
  final String id;
  final String name;
  final String email;
  final String? imagePath;

  const ChatUser({
    required this.id,
    required this.name,
    required this.email,
    this.imagePath,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imagePath': imagePath,
    };
  }

  Message toMessage({
    required String message,
  }) {
    return Message(
      id: const Uuid().v4(),
      text: message,
      createdAt: DateTime.now(),
      userId: id,
      userName: name,
      userImagePath: imagePath ?? 'assets/images/avatar.png',
    );
  }
}
