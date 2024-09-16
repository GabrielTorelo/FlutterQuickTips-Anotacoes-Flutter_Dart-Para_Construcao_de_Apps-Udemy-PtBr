import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Chat Screen'),
            ElevatedButton(
              onPressed: () {
                AuthService().logout();
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
