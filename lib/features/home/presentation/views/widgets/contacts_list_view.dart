import 'package:flutter/material.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({
    super.key,
    required this.users,
  });
  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ContactsListViewItem(
            userModel: users[index],
          ),
        );
      },
    );
  }
}
