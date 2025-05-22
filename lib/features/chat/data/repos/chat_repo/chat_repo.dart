import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/chat/data/models/message_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<MessageModel>>> getMessages(String id);
  Future<Either<Failure, void>> addMessage(
      MessageModel message, UserModel userModel);
  Future<Either<Failure, void>> createChat(UserModel userModel, String message);
}
