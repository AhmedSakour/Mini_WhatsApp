import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whats_app/core/constant/hive_boxes.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';

import '../themes/app_styles.dart';
import 'custom_popupMenuButton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'WhatsUP',
        style: AppStyles.styleBold30(context),
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            var data = Hive.box<UserModel>(kUserInfo).values;
            for (var user in data) {
              print(user.name); // Assuming `name` is a field in `UserModel`
              print(user.email);
              print(user.password); // Assuming `name` is a field in `UserModel`
              print(user.phone); // Access other fields
            }
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        const CustomPopupMenuButton()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
