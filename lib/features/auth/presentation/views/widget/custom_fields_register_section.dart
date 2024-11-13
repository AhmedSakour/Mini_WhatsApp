import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/random_string.dart';
import 'package:whats_app/features/auth/data/models/userModel.dart';
import 'package:whats_app/features/auth/presentation/views_model/auth_cubit/auth_cubit.dart';

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
  void initState() {
    BlocProvider.of<AuthCubit>(context).userModel = UserModel(
      email: emailController.text,
      id: getRandomString(10),
      name: nameController.text,
      password: passwordController.text,
      phone: phoneController.text,
    );
    super.initState();
  }

  _CustomFieldsRegisterSectionState();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Column(
      children: [
        CustomTextFormField(
          label: 'name',
          controller: nameController,
          onChanged: (value) {
            authCubit.userModel?.name = value;
          },
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
        SizedBox(
          height: height / 40,
        ),
        CustomTextFormField(
          label: 'phone',
          controller: phoneController,
          onChanged: (value) {
            authCubit.userModel?.phone = value;
          },
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
        SizedBox(
          height: height / 40,
        ),
        CustomTextFormField(
          label: 'email',
          controller: emailController,
          hint: 'enter your email',
          prefixIcon: Icons.email,
          onChanged: (value) {
            authCubit.userModel?.email = value;
          },
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
        SizedBox(
          height: height / 40,
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
          onChanged: (value) {
            authCubit.userModel?.password = value;
          },
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
