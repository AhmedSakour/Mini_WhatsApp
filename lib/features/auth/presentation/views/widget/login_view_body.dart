import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/auth/presentation/views/widget/register_section.dart';
import 'package:whats_app/features/auth/presentation/views_model/auth_cubit/auth_cubit.dart';

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
    final height = MediaQuery.sizeOf(context).height;
    final auhtCubit = BlocProvider.of<AuthCubit>(context);
    return SingleChildScrollView(
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
              SizedBox(
                height: height / 20,
              ),
              const CustomFieldsLoginSection(),
              SizedBox(
                height: height / 10,
              ),
              GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await auhtCubit.login();
                    await auhtCubit.getUserFromUserCollection();
                    await auhtCubit.cachUserInfo();
                  }
                },
                child: const CustomButton(
                  title: 'Log In',
                ),
              ),
              SizedBox(
                height: height / 15,
              ),
              const RegisterSection()
            ],
          ),
        ),
      ),
    );
  }
}
