import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.onPressed,
  });
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColor.secondaryColor,
        child: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
