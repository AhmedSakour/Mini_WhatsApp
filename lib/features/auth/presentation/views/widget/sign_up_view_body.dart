import 'package:flutter/material.dart';
import 'package:whats_app/core/shared_widget/whats_app_logo_section.dart';

import '../../../../../core/shared_widget/custom_botton.dart';
import '../../../../../core/themes/app_styles.dart';
import 'custom_fields_register_section.dart';
import 'login_section.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const WhatsAppLogoSection(),
              Text(
                'Register To New Account',
                style: AppStyles.styleBold30(context),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomFieldsRegisterSection(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/bottomNav');
                  }
                },
                child: const CustomButton(
                  title: 'Sign Up',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const LogInSection(),
            ],
          ),
        ),
      ),
    );
  }
}
