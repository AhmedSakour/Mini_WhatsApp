part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetUsersLoading extends HomeState {}

class GetUsersSuccess extends HomeState {
  final List<UserModel> users;

  GetUsersSuccess(this.users);
}

class GetUsersFailure extends HomeState {
  final String errorMessage;

  GetUsersFailure(this.errorMessage);
}
