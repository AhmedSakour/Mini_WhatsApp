import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/service_locator.dart';
import 'package:whats_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:whats_app/features/auth/presentation/views/widget/sign_up_view_body.dart';
import 'package:whats_app/features/auth/presentation/views_model/auth_cubit/auth_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else {
              Navigator.pushNamed(context, '/bottomNav');
            }
          },
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}
