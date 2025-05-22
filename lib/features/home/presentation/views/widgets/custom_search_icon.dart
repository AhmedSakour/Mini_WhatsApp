import 'package:flutter/material.dart';
import 'package:whats_app/core/constant/app_routes.dart';
import 'package:whats_app/core/themes/colors.dart';
import 'package:whats_app/features/home/presentation/views/widgets/contacts_view_body.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.search,
            arguments: ContactsViewBody.users);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: AppColor.thirdyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            Icons.search,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
