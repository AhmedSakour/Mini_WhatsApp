import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<MessageModel>>> getMessages(String id);
}
