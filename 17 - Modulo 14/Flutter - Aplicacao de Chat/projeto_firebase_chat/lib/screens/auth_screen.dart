import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/auth_form.dart';
import 'package:projeto_firebase_chat/main.dart';
import 'package:projeto_firebase_chat/models/auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;

  void _handleSubmit(Auth auth) {
    FocusScope.of(context).unfocus();

    setState(() => _isLoading = true);

    logs.highlight('Nickname: ${auth.nickname}');
    logs.sucess('Email: ${auth.email}');
    logs.sucess('Password: ${auth.password}');
    logs.highlight('Image: ${auth.image.toString()}');

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.cyan,
                    ],
                    transform: GradientRotation(
                      BorderSide.strokeAlignOutside,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: AuthForm(
                      onSubmit: _handleSubmit,
                    ),
                  ),
                  if (_isLoading)
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
