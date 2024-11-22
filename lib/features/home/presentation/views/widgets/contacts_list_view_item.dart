import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';

class ContactsListViewItem extends StatelessWidget {
  const ContactsListViewItem({
    super.key,
  });

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
          flex: 3,
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
      ],
    );
  }
}
