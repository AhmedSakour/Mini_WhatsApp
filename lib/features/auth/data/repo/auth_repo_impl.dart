import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/auth/data/models/userModel.dart';
import 'package:whats_app/features/auth/data/repo/auht_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuhtRepo {
  @override
  Future<Either<Failure, void>> login(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseAuthFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signup(UserModel? userModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel!.email,
        password: userModel.password,
      );
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseAuthFailure(e.toString()));
      }
    }
  }
}
