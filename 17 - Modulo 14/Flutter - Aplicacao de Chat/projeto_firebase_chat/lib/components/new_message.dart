import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/adaptative_field.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';
import 'package:projeto_firebase_chat/services/chat/chat_service.dart';
import 'package:projeto_firebase_chat/utils/snack_error.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _messageController = TextEditingController();
  String _message = '';

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user == null) {
      return;
    }

    await ChatService().save(message: _message, user: user).then((_) {
      FocusScope.of(context).unfocus();

      setState(() {
        _message = '';
      });

      _messageController.clear();
    }).catchError((error) {
      SnackError(context).show(
        message: 'Failed to send message',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AdaptativeTextField(
            label: 'Send a message...',
            controller: _messageController,
            onChanged: (value) => setState(() => _message = value),
            onSubmitted: _message.trim().isEmpty ? null : (_) => _sendMessage(),
            textInputAction: TextInputAction.send,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: _message.trim().isEmpty ? null : _sendMessage,
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }
}
