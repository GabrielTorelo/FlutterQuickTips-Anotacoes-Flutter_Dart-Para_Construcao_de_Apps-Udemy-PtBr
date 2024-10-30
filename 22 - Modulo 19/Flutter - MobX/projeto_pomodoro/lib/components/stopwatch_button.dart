import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const StopwatchButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.black),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          minimumSize: WidgetStateProperty.all(const Size(50, 50)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textStyle: WidgetStateProperty.all(
            Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Icon(
                icon,
                size: 35,
              ),
            ),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
