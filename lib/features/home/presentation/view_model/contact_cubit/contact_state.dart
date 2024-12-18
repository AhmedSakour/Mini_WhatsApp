part of 'contact_cubit.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}

class GetUsersLoading extends ContactState {}

class GetUsersSuccess extends ContactState {
  final List<UserModel> users;

  GetUsersSuccess(this.users);
}

class GetUsersFailure extends ContactState {
  final String errorMessage;

  GetUsersFailure(this.errorMessage);
}
