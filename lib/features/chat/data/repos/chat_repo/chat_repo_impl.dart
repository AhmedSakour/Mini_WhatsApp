import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';
import 'package:whats_app/features/chat/data/repos/chat_repo/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  @override
  Future<Either<Failure, List<MessageModel>>> getMessages(String id) async {
    try {
      // Initialize an empty list to store the chats
      List<MessageModel> messages = [];

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

        for (var chatDoc in chatsSnapshot.docs) {
          var chatData = chatDoc.data();

          if (chatDoc['userId'] == id) {
            QuerySnapshot<Map<String, dynamic>> messagesSnapshot =
                await chatDoc.reference.collection('messages').get();
            for (var messageDoc in messagesSnapshot.docs) {
              messages.add(MessageModel(
                  idSender: messageDoc.get('idSender'),
                  message: messageDoc.get('message')));
            }
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
}
