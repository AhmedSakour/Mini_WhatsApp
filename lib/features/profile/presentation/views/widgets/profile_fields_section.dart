import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';
import 'custom_profile_text_form_field.dart';

class ProfileFieldsSection extends StatelessWidget {
  ProfileFieldsSection({
    Key? key,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppStyles.styleExtrabold19(context).copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone',
            style: AppStyles.styleExtrabold19(context).copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
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
