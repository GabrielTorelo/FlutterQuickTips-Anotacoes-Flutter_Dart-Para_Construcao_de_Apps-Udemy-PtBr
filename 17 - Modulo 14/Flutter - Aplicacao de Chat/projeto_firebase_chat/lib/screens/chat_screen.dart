import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/messages.dart';
import 'package:projeto_firebase_chat/components/new_message.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: const [
              DropdownMenuItem(
                value: 'logout',
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.exit_to_app, color: Colors.black87),
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              switch (value) {
                case 'logout':
                  AuthService().logout();
                  break;
                default:
              }
            },
          )
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
