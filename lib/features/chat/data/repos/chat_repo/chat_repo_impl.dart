import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/core/functions/getUserInfoCach.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/data/repos/chat_repo/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  @override
  Future<Either<Failure, List<MessageModel>>> getMessages(String id) async {
    try {
      List<MessageModel> messages = [];
      String currentUserId = await UserInfoCache.getUserId();
      QuerySnapshot<Map<String, dynamic>> chatsSnapshot =
          await FirebaseFirestore.instance.collection('chats').get();
      for (var chatDoc in chatsSnapshot.docs) {
        List<dynamic> chatData = chatDoc['users'];

        if (chatData[0]['userId'] == currentUserId &&
                chatData[1]['userId'] == id ||
            chatData[1]['userId'] == currentUserId &&
                chatData[0]['userId'] == id) {
          var messagesSnapShots = await chatDoc.reference
              .collection('Messages')
              .orderBy('timeMessage', descending: true)
              .get();
          for (var messageDoc in messagesSnapShots.docs) {
            messages.add(MessageModel(
                idSender: messageDoc['SenderID'],
                message: messageDoc['message']));
          }
        }
      }

      return right(messages);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addMessage(
      MessageModel messageModel, UserModel userModel) async {
    try {
      String currentUserId = await UserInfoCache.getUserId();
      bool chatExists = false;
      QuerySnapshot<Map<String, dynamic>> chatsSnapshot =
          await FirebaseFirestore.instance.collection('chats').get();
      for (var chatDoc in chatsSnapshot.docs) {
        List<dynamic> chatData = chatDoc['users'];

        if (chatData[0]['userId'] == currentUserId &&
                chatData[1]['userId'] == userModel.id ||
            chatData[1]['userId'] == currentUserId &&
                chatData[0]['userId'] == userModel.id) {
          chatExists = true;
          await chatDoc.reference.update({
            'lastMessage': messageModel.message,
            'lastMessageTime': FieldValue.serverTimestamp()
          });
          await chatDoc.reference.collection('Messages').add({
            'SenderID': currentUserId,
            'message': messageModel.message,
            'timeMessage': FieldValue.serverTimestamp(),
          });
          break;
        }
      }
      if (!chatExists) {
        await createChat(userModel, messageModel.message);
      }

      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> createChat(
      UserModel userModel, String message) async {
    try {
      String currentUserId = await UserInfoCache.getUserId();
      DocumentReference chatRef =
          await FirebaseFirestore.instance.collection('chats').add({
        'lastMessage': message,
        'lastMessageTime': FieldValue.serverTimestamp(),
        'users': [
          {
            'userId': currentUserId,
            'userImage':
                'https://e7.pngegg.com/pngimages/647/460/png-clipart-computer-icons-open-person-family-icon-black-silhouette-black-thumbnail.png',
            'userName': await UserInfoCache.getUserName(),
          },
          {
            'userId': userModel.id,
            'userImage':
                'https://e7.pngegg.com/pngimages/647/460/png-clipart-computer-icons-open-person-family-icon-black-silhouette-black-thumbnail.png',
            'userName': userModel.name,
          },
        ],
      });
      await chatRef.collection('Messages').add({
        'SenderID': currentUserId,
        'message': message,
        'timeMessage': FieldValue.serverTimestamp(),
      });
      return right(null);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }
}
