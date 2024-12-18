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
      // Initialize an empty list to store the chats
      List<ChatModel> chats = [];

      // Get the current user's ID (replace this with your method to retrieve it)
      String currentUserId = await UserInfoCache.getUserId();

      // Query the 'users' collection
      QuerySnapshot<Map<String, dynamic>> usersSnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      // Iterate through each user document
      for (var userDoc in usersSnapshot.docs) {
        // Access the 'chats' subcollection under each user document
        QuerySnapshot<Map<String, dynamic>> chatsSnapshot =
            await userDoc.reference
                .collection('chats') // Navigate to the 'chats' subcollection
                .get();

        // Iterate through each document in 'chats'
        for (var chatDoc in chatsSnapshot.docs) {
          var chatData = chatDoc.data();

          // Check if the chat belongs to the current user based on 'userId'
          if (chatDoc['userId'] != currentUserId) {
            // Add chat details to the list
            chats.add(ChatModel(
              lastMessage: chatData['LastMessage'],
              image: chatData['userPhoto'],
              lastMessageTime: chatData['LastMessageTime'],
              name: chatData['userName'],
            ));
          }
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
}
