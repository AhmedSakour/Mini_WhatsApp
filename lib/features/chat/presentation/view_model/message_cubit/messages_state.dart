part of 'messages_cubit.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}

final class GetMessagesLoading extends MessagesState {}

final class GetMessagesSuccess extends MessagesState {
  final List<MessageModel> messages;

  GetMessagesSuccess(this.messages);
}

final class GetMessagesFailure extends MessagesState {
  final String errorMessage;

  GetMessagesFailure(this.errorMessage);
}
