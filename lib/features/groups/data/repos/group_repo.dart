import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/groups/data/models/group_model.dart';

abstract class GroupRepo {
  Future<Either<Failure, void>> createGroup(GroupModel groupModel);
}
