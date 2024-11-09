import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/service_locator.dart';
import 'package:whats_app/core/shared_widget/whats_app_logo_section.dart';
import 'package:whats_app/features/auth/data/repo/auht_repo.dart';
import 'package:whats_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:whats_app/features/auth/presentation/views_model/auth_cubit/auth_cubit.dart';
import 'package:whats_app/features/home/data/repo/home_repo_impl.dart';

import '../../../../../core/shared_widget/custom_botton.dart';
import '../../../../../core/themes/app_styles.dart';
import 'custom_fields_register_section.dart';
import 'login_section.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  height: 30,
                ),
                const CustomFieldsRegisterSection(),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/chat');
                      await BlocProvider.of<AuthCubit>(context).signup();
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
      ),
    );
  }
}
