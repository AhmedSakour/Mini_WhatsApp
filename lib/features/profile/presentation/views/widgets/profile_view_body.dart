import 'package:flutter/material.dart';
import 'package:whats_app/features/profile/presentation/views/widgets/photo_profile_section.dart';
import 'package:whats_app/features/profile/presentation/views/widgets/profile_fields_section.dart';

import 'custom_profile_botton.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
              alignment: Alignment.center, child: PhotoProfileSection()),
          Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey[400],
          ),
          ProfileFieldsSection(),
          GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {}
            },
            child: const CustomProfileButton(
              title: 'Save Profile',
            ),
          ),
        ],
      ),
    );
  }
}
