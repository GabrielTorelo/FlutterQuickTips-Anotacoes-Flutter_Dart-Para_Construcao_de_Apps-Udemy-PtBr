import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const ArrowButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
