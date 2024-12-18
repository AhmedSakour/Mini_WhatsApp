import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/home/presentation/view_model/contact_cubit/contact_cubit.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_list_view.dart';

class ContactsViewBody extends StatelessWidget {
  const ContactsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state is GetUsersSuccess) {
          return state.users.isNotEmpty
              ? ContactsListView(
                  users: state.users,
                )
              : Center(
                  child: Text(
                    'No Contacts For You',
                    style: AppStyles.styleBold24(context),
                  ),
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
