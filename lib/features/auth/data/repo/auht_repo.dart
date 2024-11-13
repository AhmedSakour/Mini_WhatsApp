import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/auth/data/models/userModel.dart';

abstract class AuhtRepo {
  Future<Either<Failure, void>> login(UserModel userModel);

  Future<Either<Failure, void>> signup(UserModel? userModel);
}
