import 'dart:developer';

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
      log(id);
      String currentUserId = await UserInfoCache.getUserId();

      // Determine if the ID belongs to a group or a private chat
      QuerySnapshot<Map<String, dynamic>> chatQuery = await FirebaseFirestore
          .instance
          .collection('chats')
          .where('groupId', isEqualTo: id)
          .get();

      DocumentSnapshot<Map<String, dynamic>>? chatDoc;

      if (chatQuery.docs.isNotEmpty) {
        // It's a group chat
        chatDoc = chatQuery.docs.first;
      } else {
        // It's a private chat, find chat between current user and other user
        QuerySnapshot<Map<String, dynamic>> privateChatQuery =
            await FirebaseFirestore.instance.collection('chats').get();

        // Filter the exact private chat
        for (var doc in privateChatQuery.docs) {
          var users = doc.data()['users'];
          if (!doc.data().containsKey('groupId') &&
              ((users[0]['userId'] == currentUserId &&
                      users[1]['userId'] == id) ||
                  (users[1]['userId'] == currentUserId &&
                      users[0]['userId'] == id))) {
            chatDoc = doc;
            break;
          }
        }
      }

      if (chatDoc == null) {
        // No matching chat found
        return right([]);
      }

      // Fetch messages from the specific chat
      QuerySnapshot<Map<String, dynamic>> messagesSnapshot = await chatDoc
          .reference
          .collection('Messages')
          .orderBy('timeMessage', descending: true)
          .get();

      messages = messagesSnapshot.docs.map((doc) {
        return MessageModel(
          idSender: doc['SenderID'],
          message: doc['message'],
        );
      }).toList();

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
        if (chatDoc.data().containsKey('groupId')) {
          await addMessageInGroup(
              chatDoc.reference, currentUserId, messageModel, userModel);
          chatExists = true;
        } else {
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

  addMessageInGroup(DocumentReference<Map<String, dynamic>> chatDoc,
      String userId, MessageModel messageModel, UserModel userModel) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await chatDoc.get();
    Map<String, dynamic>? data = snapshot.data();
    if (data != null) {
      if (userModel.id == data['groupId']) {
        await chatDoc.update({
          'lastMessage': messageModel.message,
          'lastMessageTime': FieldValue.serverTimestamp()
        });
        await chatDoc.collection('Messages').add({
          'SenderID': userId,
          'message': messageModel.message,
          'timeMessage': FieldValue.serverTimestamp(),
        });
      }
    }
  }
}
