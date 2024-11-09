import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.secondaryColor,
        child: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
