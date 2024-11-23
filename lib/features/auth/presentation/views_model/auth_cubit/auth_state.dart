part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

class AddUserToUserCollectionSuccess extends AuthState {}

class AddUserToUserCollectionFailure extends AuthState {
  final String errorMessage;

  AddUserToUserCollectionFailure(this.errorMessage);
}
