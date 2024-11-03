import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/alert_error.dart';
import 'package:shop/exceptions/auth_exception.dart';
import 'package:shop/models/auth.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool _isLoading = false;
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
        _controller?.forward();
      } else {
        _authMode = AuthMode.login;
        _controller?.reverse();
      }
    });
  }

  void _showErrorDialog({String? message}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertError(
        message: switch (message) {
          null || 'null' => null,
          _ => message,
        },
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Auth auth = Provider.of(context, listen: false);

    setState(() => _isLoading = true);

    try {
      if (_isLogin()) {
        await auth.authentication(
          email: _authData['email']!,
          password: _authData['password']!,
          authMode: AuthMode.login,
        );
      } else {
        await auth.authentication(
          email: _authData['email']!,
          password: _authData['password']!,
          authMode: AuthMode.signup,
        );
      }
    } on AuthException catch (error) {
      _showErrorDialog(
        message: error.toString(),
      );
    } catch (_) {
      _showErrorDialog();
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          child: IntrinsicHeight(
            child: SizedBox(
              width: deviceSize.width * 0.65,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => _authData['email'] = value ?? '',
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a e-mail',
                          _ => null,
                        };
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _passwordController,
                      onSaved: (value) => _authData['password'] = value ?? '',
                      validator: (value) {
                        return switch (value?.trim()) {
                          '' || null => 'Please enter a password',
                          _ => _isSignup() && value!.trim().length < 8
                              ? 'Password must be at least 8 characters long'
                              : null,
                        };
                      },
                    ),
                    AnimatedContainer(
                      constraints: BoxConstraints(
                        minHeight: _isSignup() ? 60 : 0,
                        maxHeight: _isSignup() ? 120 : 0,
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                      child: FadeTransition(
                        opacity: _opacityAnimation!,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Repeat Password',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            if (_isLogin()) return null;

                            return switch (value?.trim()) {
                              '' || null => 'Please enter a password',
                              _ => value!.trim() != _passwordController.text
                                  ? 'Passwords must be identical'
                                  : null,
                            };
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 8,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                _isLogin() ? 'ENTER' : 'REGISTER',
                              ),
                            ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _switchAuthMode,
                      child: Text(
                        _isLogin() ? "Don't have an account yet?" : "Login now",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
