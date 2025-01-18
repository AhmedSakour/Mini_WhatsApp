part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<UserModel> users;

  SearchSuccess({required this.users});
}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {}
