import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/models/chat_user.dart';
import 'package:projeto_firebase_chat/screens/auth_screen.dart';
import 'package:projeto_firebase_chat/screens/chat_screen.dart';
import 'package:projeto_firebase_chat/screens/error_screen.dart';
import 'package:projeto_firebase_chat/screens/loading_screen.dart';
import 'package:projeto_firebase_chat/services/auth/auth_service.dart';
import 'package:projeto_firebase_chat/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  Future<void> _initNotifications(BuildContext context) async {
    await Provider.of<ChatNotificationService>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initNotifications(context),
        builder: (ctx, snpsht) {
          return switch (snpsht.connectionState) {
            ConnectionState.waiting => const LoadingScreen(),
            ConnectionState.done => StreamBuilder<ChatUser?>(
                stream: AuthService().onAuthStateChanged,
                builder: (ctx, snapshot) {
                  return switch (snapshot.connectionState) {
                    ConnectionState.waiting => const LoadingScreen(),
                    ConnectionState.active => snapshot.hasData
                        ? const ChatScreen()
                        : const AuthScreen(),
                    _ => const ErrorScreen(),
                  };
                },
              ),
            _ => const ErrorScreen(),
          };
        });
  }
}
