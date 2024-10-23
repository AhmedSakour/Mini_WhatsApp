import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColor.greyColor,
      onSelected: (value) {
        // Handle the menu selection
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
            value: 'log out',
            child: Text('Log Out'),
          ),
        ];
      },
    );
  }
}
