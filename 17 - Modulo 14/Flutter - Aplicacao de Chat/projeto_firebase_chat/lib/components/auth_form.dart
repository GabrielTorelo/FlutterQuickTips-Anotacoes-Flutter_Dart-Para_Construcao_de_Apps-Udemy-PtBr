import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/components/adaptative_form_field.dart';
import 'package:projeto_firebase_chat/models/auth.dart';

class AuthForm extends StatefulWidget {
  final void Function(Auth auth) onSubmit;

  const AuthForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final Auth _auth = Auth();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nickNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    _auth.nickname = _nickNameController.text.trim();
    _auth.email = _emailController.text.trim();
    _auth.password = _passwordController.text.trim();

    widget.onSubmit(_auth);
  }

  @override
  void dispose() {
    _nickNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    if (_auth.isSignup)
                      AdaptativeTextFormField(
                        controller: _nickNameController,
                        maxLength: 50,
                        label: 'Nickname',
                        onFieldSubmitted: _submit,
                        validator: (value) {
                          return switch (value?.trim()) {
                            '' || null => 'Please enter a valid nickname',
                            _ => value!.trim().length < 3
                                ? 'Nickname must have at least 3 characters'
                                : null,
                          };
                        },
                      ),
                    AdaptativeTextFormField(
                      controller: _emailController,
                      maxLength: _auth.isSignup ? 100 : null,
                      label: 'Email',
                      onFieldSubmitted: _submit,
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a valid email',
                          _ => value!.trim().length < 11
                              ? 'Email must have at least 11 characters'
                              : value.trim().contains('@') &&
                                      value.trim().contains('.')
                                  ? null
                                  : 'Please enter a valid email'
                        };
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AdaptativeTextFormField(
                      controller: _passwordController,
                      isPassword: true,
                      maxLength: _auth.isSignup ? 50 : null,
                      label: 'Password',
                      onFieldSubmitted: _submit,
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a valid password',
                          _ => value!.trim().length < 6
                              ? 'Password must have at least 6 characters'
                              : null,
                        };
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    if (_auth.isSignup)
                      AdaptativeTextFormField(
                        controller: _rePasswordController,
                        isPassword: true,
                        maxLength: 50,
                        label: 'Confirm password',
                        onFieldSubmitted: _submit,
                        validator: (value) {
                          return switch (value?.trim()) {
                            '' || null => 'Please confirm your password',
                            _ =>
                              value!.trim() != _passwordController.text.trim()
                                  ? 'Passwords do not match'
                                  : null,
                          };
                        },
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    _auth.isLogin ? 'ENTER' : 'REGISTER',
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  _auth.isLogin ? "Don't have an account yet?" : "Login now",
                ),
                onPressed: () {
                  setState(() {
                    _auth.toggleMode();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
