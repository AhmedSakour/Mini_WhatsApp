import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';
import 'custom_profile_text_form_field.dart';

class ProfileFieldsSection extends StatelessWidget {
  ProfileFieldsSection({
    super.key,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppStyles.styleExtrabold19(context).copyWith(fontSize: 22),
          ),
          SizedBox(
            height: height / 35,
          ),
          CustomProfileTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter your name';
                }
                return null;
              },
              textInputType: TextInputType.name,
              controller: nameController),
          SizedBox(
            height: height / 30,
          ),
          Text(
            'Phone',
            style: AppStyles.styleExtrabold19(context).copyWith(fontSize: 22),
          ),
          SizedBox(
            height: height / 30,
          ),
          CustomProfileTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter your phone';
                }
                return null;
              },
              textInputType: TextInputType.phone,
              controller: phoneController),
        ],
      ),
    );
  }
}
