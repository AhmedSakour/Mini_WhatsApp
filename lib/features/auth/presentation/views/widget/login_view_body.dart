import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/auth/presentation/views/widget/register_section.dart';

import '../../../../../core/shared_widget/custom_botton.dart';
import '../../../../../core/shared_widget/whats_app_logo_section.dart';
import 'custom_fields_login_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const WhatsAppLogoSection(),
              Text(
                'log in to your account',
                style: AppStyles.styleBold30(context),
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomFieldsLoginSection(),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: const CustomButton(
                  title: 'Log In',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const RegisterSection()
            ],
          ),
        ),
      ),
    ));
  }
}
