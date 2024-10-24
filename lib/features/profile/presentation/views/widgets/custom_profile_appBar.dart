import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/colors.dart';

import '../../../../../core/themes/app_styles.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.secondaryColor,
          )),
      centerTitle: false,
      title: Text(
        'Profile',
        style: AppStyles.styleBold30(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
