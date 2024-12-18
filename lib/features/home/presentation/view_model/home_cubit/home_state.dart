part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetChatsLoading extends HomeState {}

class GetChatsSuccess extends HomeState {
  final List<ChatModel> chats;

  GetChatsSuccess(this.chats);
}

class GetChatsFailure extends HomeState {
  final String errorMessage;

  GetChatsFailure(this.errorMessage);
}
