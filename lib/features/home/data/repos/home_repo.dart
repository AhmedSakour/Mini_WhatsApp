import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UserModel>>> getUsers(List<UserModel> users);
}
