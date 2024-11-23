import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/shared_widget/whats_app_logo_section.dart';
import 'package:whats_app/features/auth/presentation/views_model/auth_cubit/auth_cubit.dart';

import '../../../../../core/shared_widget/custom_botton.dart';
import '../../../../../core/themes/app_styles.dart';
import 'custom_fields_register_section.dart';
import 'login_section.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final auhtCubit = BlocProvider.of<AuthCubit>(context);
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
              SizedBox(
                height: height / 20,
              ),
              const CustomFieldsRegisterSection(),
              SizedBox(
                height: height / 30,
              ),
              GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await auhtCubit.signup();
                      await auhtCubit.addUserToUserCollection();
                    } on Exception catch (e) {
                      // TODO
                    }
                  }
                },
                child: const CustomButton(
                  title: 'Sign Up',
                ),
              ),
              SizedBox(
                height: height / 35,
              ),
              const LogInSection(),
            ],
          ),
        ),
      ),
    );
  }
}
