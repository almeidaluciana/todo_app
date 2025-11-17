import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? initialValue;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final double borderRadius;

  const Input({
    super.key,
    this.initialValue,
    required this.label,
    this.controller,
    this.validator,
    this.onSaved,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      decoration: InputDecoration(
        labelText: label,
        // quando o campo não está selecionado
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        // quando o campo está selecionado
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: colorScheme.primaryContainer, width: 2),
        ),
        // quando não digitou nada
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        // quando não digitou nada e está selecionado
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
