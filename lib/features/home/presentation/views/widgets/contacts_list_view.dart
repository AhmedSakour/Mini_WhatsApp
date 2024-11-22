import 'package:flutter/material.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_list_view_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ContactsListViewItem(),
        );
      },
    );
  }
}
