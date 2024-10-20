import 'package:flutter/material.dart';

import '../../../../../core/themes/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.secondaryColor,
        child: const Icon(Icons.chat));
  }
}
