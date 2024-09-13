import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_firebase_chat/extensions/platform_extension.dart';

class AdaptativeTextFormField extends StatelessWidget {
  final int? maxLength;
  final String label;
  final String? initialValue;
  final TextEditingController controller;
  final void Function() onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;

  const AdaptativeTextFormField({
    super.key,
    this.maxLength,
    required this.label,
    this.initialValue,
    required this.controller,
    required this.onFieldSubmitted,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      controller.text = initialValue!;
    }

    return Device.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextFormFieldRow(
              key: ValueKey(label),
              obscureText: isPassword,
              maxLength: maxLength,
              initialValue: initialValue,
              controller: controller,
              placeholder: label,
              textInputAction: textInputAction,
              onFieldSubmitted: (_) => onFieldSubmitted(),
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              validator: validator,
            ),
          )
        : TextFormField(
            key: ValueKey(label),
            obscureText: isPassword,
            maxLength: maxLength,
            initialValue: initialValue,
            controller: controller,
            decoration: InputDecoration(labelText: label),
            textInputAction: textInputAction,
            onFieldSubmitted: (_) => onFieldSubmitted(),
            keyboardType: keyboardType,
            validator: validator,
          );
  }
}
