import 'package:flutter/material.dart';

class CustomProfileTextFormField extends StatelessWidget {
  const CustomProfileTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
