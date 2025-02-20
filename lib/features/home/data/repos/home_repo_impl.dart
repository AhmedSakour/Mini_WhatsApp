import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/core/functions/getUserInfoCach.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/models/chat_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<UserModel>>> getUsers(
      List<UserModel> users) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('users').get();

      for (var element in data.docs) {
        if (await UserInfoCache.getUserId() != element.get('id')) {
          users.add(UserModel(
              name: element.get('name'),
              email: element.get('email'),
              password: element.get('password'),
              phone: element.get('phone'),
              imageProfile: element.get('imageProfile'),
              id: element.get('id')));
        }
      }
      return right(users);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getChats() async {
    try {
      List<ChatModel> chats = [];
      String currentUserId = await UserInfoCache.getUserId();

      QuerySnapshot<Map<String, dynamic>> chatsSnapshot =
          await FirebaseFirestore.instance
              .collection('chats')
              .orderBy('lastMessageTime', descending: true)
              .get();
      for (var chatDoc in chatsSnapshot.docs) {
        List<dynamic> chatData = chatDoc['users'];
        // if (chatDoc.data().containsKey('groupId')) {
        //   ChatModel data = getGroups(chatDoc.reference);
        //   chats.add(data);
        // }
        if (chatData[0]['userId'] == currentUserId) {
          chats.add(ChatModel(
              lastMessage: chatDoc['lastMessage'],
              image: chatData[1]['userImage'],
              userId: chatData[1]['userId'],
              lastMessageTime: chatDoc['lastMessageTime'].toDate(),
              name: chatData[1]['userName']));
        } else if (chatData[1]['userId'] == currentUserId) {
          chats.add(ChatModel(
              lastMessage: chatDoc['lastMessage'],
              image: chatData[0]['userImage'],
              userId: chatData[0]['userId'],
              lastMessageTime: chatDoc['lastMessageTime'].toDate(),
              name: chatData[0]['userName']));
        }
      }

      return right(chats);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }

//  ChatModel getGroups(DocumentReference<Map<String, dynamic>> chatDoc) {
//    return ChatModel(lastMessage: chatDoc['lastMessage'], image:chatDoc['groupImage'], userId: chatDoc['groupId'], lastMessageTime: chatDoc['lastMessageTime'], name: chatDoc['groupName'])
//   }
}
