import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';

class CustomChatviewAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomChatviewAppbar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        name,
        style: AppStyles.styleBold24(context),
      ),
      automaticallyImplyLeading: false,
      actions: const [
        Icon(Icons.videocam_sharp),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.call),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_vert),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
