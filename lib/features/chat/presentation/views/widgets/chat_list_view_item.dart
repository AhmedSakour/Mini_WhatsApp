import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/themes/colors.dart';

class ChatListViewItem extends StatelessWidget {
  const ChatListViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'rowan',
                style: AppStyles.styleBold24(context),
              ),
              Text(
                '#0938605821',
                style: AppStyles.styleMedium20(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '12:00 PM',
                style: AppStyles.styleBold14(context),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CircleAvatar(
                    backgroundColor: AppColor.secondaryColor,
                    radius: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '2',
                        style: AppStyles.styleBold14(context)
                            .copyWith(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
