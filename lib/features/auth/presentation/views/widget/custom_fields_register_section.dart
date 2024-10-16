import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_form_field.dart';

class CustomFieldsRegisterSection extends StatefulWidget {
  const CustomFieldsRegisterSection({super.key});
  @override
  State<CustomFieldsRegisterSection> createState() =>
      _CustomFieldsRegisterSectionState();
}

class _CustomFieldsRegisterSectionState
    extends State<CustomFieldsRegisterSection> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'name',
          controller: nameController,
          hint: 'enter your name',
          prefixIcon: Icons.person,
          textInputType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your name';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'phone',
          controller: phoneController,
          hint: 'enter your phone',
          prefixIcon: Icons.phone,
          textInputType: TextInputType.phone,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your phone';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
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
          height: 20,
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
