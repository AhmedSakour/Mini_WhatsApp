import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';

class ContactsListViewItem extends StatelessWidget {
  const ContactsListViewItem({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            child: CachedNetworkImage(
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              imageUrl: userModel.imageProfile!,
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name,
                style: AppStyles.styleBold24(context),
              ),
              Text(
                userModel.phone,
                style: AppStyles.styleMedium20(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
