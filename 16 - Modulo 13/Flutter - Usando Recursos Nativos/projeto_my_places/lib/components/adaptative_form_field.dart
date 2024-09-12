import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_my_places/extensions/platform_extension.dart';

class AdaptativeTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final String label;
  final String? initialValue;
  final void Function() onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const AdaptativeTextFormField({
    super.key,
    required this.controller,
    required this.maxLength,
    required this.label,
    this.initialValue,
    required this.onFieldSubmitted,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Device.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextFormFieldRow(
              controller: controller,
              maxLength: maxLength,
              initialValue: initialValue,
              placeholder: label,
              textInputAction: textInputAction,
              onFieldSubmitted: (_) => onFieldSubmitted(),
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              validator: validator,
            ),
          )
        : TextFormField(
            controller: controller,
            maxLength: maxLength,
            initialValue: initialValue,
            decoration: InputDecoration(labelText: label),
            textInputAction: textInputAction,
            onFieldSubmitted: (_) => onFieldSubmitted(),
            keyboardType: keyboardType,
            validator: validator,
          );
  }
}
