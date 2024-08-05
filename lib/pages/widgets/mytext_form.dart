import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final Icon? leadingIcon;
  final IconButton? suffixIcon;
  final bool enabled;
  final List<String>? autofillHints;
  final TextEditingController? textEditingController;


  const MyTextForm({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.leadingIcon,
    this.suffixIcon,
    this.enabled = true,
    this.autofillHints, this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofillHints: autofillHints,
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
          onFieldSubmitted?.call(value);
        },
        decoration: InputDecoration(
          enabled: enabled,
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(
            color: borderColor,
          ),
          hintStyle: TextStyle(
            color: borderColor.withOpacity(0.6),
          ),
          prefixIcon: leadingIcon,
          suffixIcon: suffixIcon,
        ),
        style: TextStyle(
          fontSize: 16.0,
          color: theme.textTheme.bodyLarge?.color ?? Colors.black,
        ),
      ),
    );
  }
}
