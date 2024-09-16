import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/routes/app_routes.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Icon(
              Icons.error_outline,
              size: 70,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                'An unknown error occurred!\nTry again later',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.authOrHome);
            },
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.blue),
                  overlayColor: WidgetStateProperty.all(
                    Colors.blue.withOpacity(0.1),
                  ),
                ),
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}
