import 'package:flutter/material.dart';
import 'package:whats_app/core/constant/app_routes.dart';

import '../themes/colors.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColor.greyColor,
      onSelected: (value) {
        if (value == 'profile') {
          Navigator.pushNamed(context, AppRoutes.profile);
        } else if (value == 'new_group') {
          Navigator.pushNamed(context, AppRoutes.group);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'new_group',
            child: Text('New Group'),
          ),
          const PopupMenuItem<String>(
            value: 'profile',
            child: Text('Profile'),
          ),
          const PopupMenuItem<String>(
            value: 'log_out',
            child: Text('Log Out'),
          ),
        ];
      },
    );
  }
}
