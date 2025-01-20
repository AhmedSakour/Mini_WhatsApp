import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';

class CustomGroupTextfield extends StatelessWidget {
  const CustomGroupTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'enter the name of group',
          hintStyle: AppStyles.styleMedium20(context),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
