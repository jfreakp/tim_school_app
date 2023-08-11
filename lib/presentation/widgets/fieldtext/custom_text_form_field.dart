
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChange;
  final String? Function(String?)? validator;

  const CustomFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChange,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: border,
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          isDense: true,
          hintText: hint,
          errorText: errorMessage,
          label: label != null ? Text(label!) : null),
    );
  }
}