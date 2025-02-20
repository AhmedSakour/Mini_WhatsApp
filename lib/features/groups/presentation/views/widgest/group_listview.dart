import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/features/groups/presentation/views/widgest/group_listview_item.dart';
import 'package:whats_app/features/home/presentation/view_model/contact_cubit/contact_cubit.dart';

class Grouplistview extends StatefulWidget {
  const Grouplistview({
    super.key,
  });

  @override
  State<Grouplistview> createState() => _GrouplistviewState();
}

class _GrouplistviewState extends State<Grouplistview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state is GetUsersSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                child: GroupListviewItem(
                  user: state.users[index],
                ),
              );
            },
            itemCount: state.users.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
