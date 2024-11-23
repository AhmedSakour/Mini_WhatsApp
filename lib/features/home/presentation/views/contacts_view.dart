import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/functions/service_locator.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo_impl.dart';
import 'package:whats_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_view_body.dart';
import 'package:whats_app/features/home/presentation/views/widgets/custom_contactview_appBar.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<UserModel> users = [];
    return BlocProvider<HomeCubit>(
      create: (context) =>
          HomeCubit(getIt.get<HomeRepoImpl>())..getUsers(users),
      child: const Scaffold(
        appBar: CustomContactviewAppbar(),
        body: ContactsViewBody(),
      ),
    );
  }
}
