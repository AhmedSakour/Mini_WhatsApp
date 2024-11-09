import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/service_locator.dart';
import 'package:whats_app/core/shared_widget/whats_app_logo_section.dart';
import 'package:whats_app/features/auth/data/repo/auth_repo_impl.dart';
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
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: SingleChildScrollView(
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
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/bottomNav');
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
      ),
    );
  }
}
