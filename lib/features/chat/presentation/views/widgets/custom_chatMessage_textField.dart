import 'package:flutter/material.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/core/themes/colors.dart';

class CustomChatMessageTextField extends StatelessWidget {
  const CustomChatMessageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      height: 61,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.face,
                        color: AppColor.primaryColor,
                      ),
                      onPressed: () {}),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write Something...",
                          hintStyle: AppStyles.styleRegular16(context),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon:
                        Icon(Icons.photo_camera, color: AppColor.primaryColor),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file, color: AppColor.primaryColor),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: AppColor.primaryColor, shape: BoxShape.circle),
            child: InkWell(
              child: const Icon(
                Icons.keyboard_voice,
                color: Colors.white,
              ),
              onLongPress: () {},
            ),
          )
        ],
      ),
    );
  }
}
