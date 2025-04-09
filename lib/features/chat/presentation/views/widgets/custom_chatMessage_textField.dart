import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/themes/app_styles.dart';
import 'package:whats_app/core/themes/colors.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/presentation/view_model/addMessage_cubit/add_message_cubit.dart';

class CustomChatMessageTextField extends StatelessWidget {
  CustomChatMessageTextField({
    super.key,
    required this.userModel,
    required this.idUser,
  });
  final UserModel userModel;
  final String idUser;
  TextEditingController textEditingController = TextEditingController();
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
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        textEditingController.clear();
                        await BlocProvider.of<AddMessageCubit>(context)
                            .addMessage(
                                MessageModel(
                                    idSender: idUser,
                                    message: value,
                                    nameSender: userModel.name),
                                UserModel(
                                    name: userModel.name,
                                    email: userModel.email,
                                    password: userModel.password,
                                    phone: userModel.phone,
                                    id: userModel.id));
                      },
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
