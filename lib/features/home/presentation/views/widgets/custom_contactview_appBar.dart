import 'package:flutter/material.dart';
import 'package:whats_app/features/home/presentation/views/widgets/custom_search_icon.dart';

class CustomContactviewAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomContactviewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [CustomSearchIcon()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
