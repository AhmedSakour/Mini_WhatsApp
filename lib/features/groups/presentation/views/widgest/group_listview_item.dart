import 'package:flutter/material.dart';
import 'package:whats_app/core/constant/app_images.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/core/themes/colors.dart';

class GroupListviewItem extends StatefulWidget {
  const GroupListviewItem({super.key});

  @override
  State<GroupListviewItem> createState() => _GroupListviewItemState();
}

class _GroupListviewItemState extends State<GroupListviewItem> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          backgroundImage: AssetImage(Assets.imagesPerson),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ahmad',
                style: AppStyles.styleBold24(context),
              ),
              Text(
                '0938605821',
                style: AppStyles.styleRegular16(context),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Checkbox(
            value: isSelect,
            activeColor: AppColor.primaryColor,
            onChanged: (value) {
              setState(() {
                isSelect = value!;
              });
            },
          ),
        )
      ],
    );
  }
}
