import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';

class CustomFieldsLoginSection extends StatefulWidget {
  const CustomFieldsLoginSection({super.key});

  @override
  State<CustomFieldsLoginSection> createState() =>
      _CustomFieldsLoginSectionState();
}

class _CustomFieldsLoginSectionState extends State<CustomFieldsLoginSection> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool visiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'email',
          controller: emailController,
          hint: 'enter your email',
          prefixIcon: Icons.email,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your email';
            } else if (!value.contains('@gmail.com')) {
              return ' email format error';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTextFormField(
          obscureText: visiblePassword,
          suffixIcon: visiblePassword ? Icons.visibility_off : Icons.visibility,
          suffixFunction: () {
            visiblePassword = !visiblePassword;
            setState(() {});
          },
          label: 'password',
          controller: passwordController,
          hint: 'enter your password',
          prefixIcon: Icons.lock,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your password';
            } else if (value.length < 8) {
              return 'short password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
