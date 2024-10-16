import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/core/themes/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.prefixIcon,
      required this.hint,
      this.obscureText = false,
      this.suffixIcon,
      this.suffixFunction,
      required this.validator,
      required this.label});
  final TextEditingController controller;
  final TextInputType textInputType;
  final IconData prefixIcon;
  final String hint;
  final String label;
  final bool obscureText;
  final IconData? suffixIcon;
  final Function()? suffixFunction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: AppStyles.styleRegular20(context).copyWith(
            color: AppColor.secondaryColor,
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon:
              IconButton(onPressed: suffixFunction, icon: Icon(suffixIcon)),
          hintText: hint,
          hintStyle: AppStyles.styleRegular20(context),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
