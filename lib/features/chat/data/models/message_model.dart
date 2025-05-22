import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String idSender;
  final String message;
  final String nameSender;

  MessageModel({
    required this.idSender,
    required this.message,
    required this.nameSender,
  });

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      nameSender: data['nameSender'],
      idSender: data['idSender'],
      message: data['message'],
    );
  }
}
