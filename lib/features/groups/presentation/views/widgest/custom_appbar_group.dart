import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';

class CustomAppbarGroup extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarGroup({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        'New Group',
        style: AppStyles.styleBold24(context),
      ),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: Text(
              'done',
              style: AppStyles.styleMedium20(context),
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
