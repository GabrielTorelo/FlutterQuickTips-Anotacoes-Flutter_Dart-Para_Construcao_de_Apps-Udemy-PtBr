import 'package:flutter/material.dart';

class Distinctive extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? bgColor;
  final Color? textColor;

  const Distinctive({
    super.key,
    required this.child,
    required this.value,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: bgColor ?? Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: textColor ?? Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
