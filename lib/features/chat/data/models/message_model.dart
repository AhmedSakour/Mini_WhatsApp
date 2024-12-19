import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String idSender;
  final String message;

  MessageModel({
    required this.idSender,
    required this.message,
  });

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      idSender: data['idSender'],
      message: data['message'],
    );
  }
}
