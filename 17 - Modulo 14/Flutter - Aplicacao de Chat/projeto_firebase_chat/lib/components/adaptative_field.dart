import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/extensions/platform_extension.dart';

class AdaptativeTextField extends StatelessWidget {
  final int? maxLength;
  final String label;
  final TextEditingController controller;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmitted;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;

  const AdaptativeTextField({
    super.key,
    this.maxLength,
    required this.label,
    required this.controller,
    required this.onChanged,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Device.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              key: ValueKey(label),
              obscureText: isPassword,
              maxLength: maxLength,
              controller: controller,
              placeholder: label,
              onChanged: (value) => onChanged(value),
              onSubmitted: onSubmitted,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            ),
          )
        : TextField(
            key: ValueKey(label),
            obscureText: isPassword,
            maxLength: maxLength,
            controller: controller,
            decoration: InputDecoration(labelText: label),
            onChanged: (value) => onChanged(value),
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
          );
  }
}
