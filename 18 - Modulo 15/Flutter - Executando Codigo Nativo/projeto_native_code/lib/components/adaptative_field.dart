import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_native_code/extensions/platform_extension.dart';

class AdaptativeTextField extends StatelessWidget {
  final int? maxLength;
  final String label;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmitted;
  final Color? backgroundColor;
  final double? borderRadius;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;

  const AdaptativeTextField({
    super.key,
    this.maxLength,
    required this.label,
    this.controller,
    required this.onChanged,
    this.onSubmitted,
    this.backgroundColor,
    this.borderRadius,
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
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
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
            decoration: InputDecoration(
              labelText: label,
              filled: true,
              fillColor: backgroundColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) => onChanged(value),
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
          );
  }
}
