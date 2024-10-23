import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/colors.dart';

import '../themes/app_styles.dart';
import 'custom_popupMenuButton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

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
          onPressed: () {},
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
