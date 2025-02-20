import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/core/functions/getUserInfoCach.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/groups/data/models/group_model.dart';
import 'package:whats_app/features/groups/data/repos/group_repo.dart';

class GroupRepoImpl implements GroupRepo {
  @override
  Future<Either<Failure, void>> createGroup(GroupModel groupModel) async {
    groupModel.users.add(UserModel(
        name: await UserInfoCache.getUserName(),
        email: await UserInfoCache.getUserEmail(),
        password: '',
        phone: await UserInfoCache.getUserPhone(),
        id: await UserInfoCache.getUserId()));
    try {
      await FirebaseFirestore.instance.collection('chats').add({
        'lastMessage': groupModel.lastMessage,
        'lastMessageTime': groupModel.lastMessageTime,
        'groupImage': groupModel.groupImage,
        'groupName': groupModel.groupName,
        'users': groupModel.users
            .map((element) => {
                  'userId': element.id,
                  'userName': element.name,
                })
            .toList(),
      });

      return right(null);
    } on Exception catch (e) {
      log(e.toString());
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }
}
