part of 'group_cubit.dart';

@immutable
sealed class GroupState {}

final class GroupInitial extends GroupState {}

final class CreateGroupLoading extends GroupState {}

final class CreateGroupFailure extends GroupState {
  final String errorMessage;

  CreateGroupFailure(this.errorMessage);
}

final class CreateGroupSuccess extends GroupState {}

final class UpdateGroupModel extends GroupState {}
