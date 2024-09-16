import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/models/message.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class MessageBubble extends StatelessWidget {
  final ChatUser? currentUser = AuthService().currentUser;
  final Message message;

  MessageBubble({
    super.key,
    required this.message,
  });

  bool get isMe => message.userId == currentUser?.id;

  Widget _showUserImage(String userImagePath) {
    ImageProvider? imageProvider;
    final Uri uri = Uri.parse(userImagePath);

    if (uri.path.contains('assets') == true) {
      imageProvider = AssetImage(uri.path);
    } else if (uri.scheme.contains('http') == true ||
        uri.scheme.contains('https') == true) {
      imageProvider = NetworkImage(uri.toString());
    } else {
      imageProvider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: imageProvider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isMe
                        ? const Color.fromRGBO(224, 224, 224, 1)
                        : Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: Radius.circular(isMe ? 12 : 0),
                      bottomRight: Radius.circular(isMe ? 0 : 12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isMe ? Colors.black : Colors.white,
                          ),
                        ),
                        Text(
                          message.text,
                          textAlign: isMe ? TextAlign.end : TextAlign.start,
                          style: TextStyle(
                            color: isMe ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 155,
          right: isMe ? 155 : null,
          child: _showUserImage(message.userImagePath),
        ),
      ],
    );
  }
}
