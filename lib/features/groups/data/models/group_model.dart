import 'package:whats_app/features/auth/data/models/user_model.dart';

class GroupModel {
  final String groupImage;
  String groupName;
  final String groupID;
  final String lastMessage;
  final String lastMessageTime;
  final List<UserModel> users;

  GroupModel(
      {required this.groupImage,
      required this.users,
      required this.groupName,
      required this.groupID,
      required this.lastMessage,
      required this.lastMessageTime});
}
