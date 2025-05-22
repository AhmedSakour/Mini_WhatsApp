import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';

abstract class AuhtRepo {
  Future<Either<Failure, void>> login(UserModel? userModel);

  Future<Either<Failure, void>> signup(UserModel? userModel);
  Future<Either<Failure, void>> addUserToUserCollection(UserModel? userModel);
  Future<void> cachUserInfo(UserModel? userModel);
  Future<Either<Failure, UserModel>> getUserFromUserCollection(
      UserModel? userModel);
}
