import 'package:expenses/extensions/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label; // Atributo final
  final void Function() onPressed; // Atributo final

  // Para definir um construtor como "const", todos os atributos devem ser "final"
  const AdaptativeButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Device.isIOS
        ? CupertinoButton(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: onPressed,
            child: Text(label),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
