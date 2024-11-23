import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_list_view.dart';

class ContactsViewBody extends StatelessWidget {
  const ContactsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetUsersSuccess) {
          return ContactsListView(
            users: state.users,
          );
        } else if (state is GetUsersFailure) {
          return Center(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
