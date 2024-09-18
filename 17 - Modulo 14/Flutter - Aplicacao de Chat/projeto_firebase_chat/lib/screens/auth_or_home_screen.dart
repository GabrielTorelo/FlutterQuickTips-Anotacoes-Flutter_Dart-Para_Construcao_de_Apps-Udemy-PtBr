import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/screens/auth_screen.dart';
import 'package:projeto_firebase_chat/screens/chat_screen.dart';
import 'package:projeto_firebase_chat/screens/error_screen.dart';
import 'package:projeto_firebase_chat/screens/loading_screen.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatUser?>(
      stream: AuthService().onAuthStateChanged,
      builder: (ctx, snapshot) {
        return switch (snapshot.connectionState) {
          ConnectionState.waiting => const LoadingScreen(),
          ConnectionState.active =>
            snapshot.hasData ? const ChatScreen() : const AuthScreen(),
          _ => const ErrorScreen(),
        };
      },
    );
  }
}
