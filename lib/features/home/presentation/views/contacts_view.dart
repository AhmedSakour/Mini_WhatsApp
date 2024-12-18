import 'package:flutter/material.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_view_body.dart';
import 'package:whats_app/features/home/presentation/views/widgets/custom_contactview_appBar.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({
    super.key,
  });

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomContactviewAppbar(),
      body: ContactsViewBody(),
    );
  }
}
