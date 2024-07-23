import 'package:expenses/extensions/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final void Function() onSubmitted;
  final TextInputType keyboardType;

  const AdaptativeTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.onSubmitted,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Device.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              placeholder: label,
              onSubmitted: (_) => onSubmitted(),
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            ),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            onSubmitted: (_) => onSubmitted(),
            keyboardType: keyboardType,
          );
  }
}
