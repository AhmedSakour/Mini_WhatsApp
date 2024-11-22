import 'package:flutter/material.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_view_body.dart';
import 'package:whats_app/features/home/presentation/views/widgets/custom_contactview_appBar.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomContactviewAppbar(),
      body: ContactsViewBody(),
    );
  }
}
