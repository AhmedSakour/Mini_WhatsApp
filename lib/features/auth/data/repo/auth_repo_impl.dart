import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/auth/data/repo/auht_repo.dart';

class AuthRepoImpl extends AuhtRepo {
  @override
  Future<Either<Failure, void>> login(UserModel? userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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

  @override
  Future<Either<Failure, void>> addUserToUserCollection(
      UserModel? userModel) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': userModel!.name,
        'password': userModel.password,
        'phone': userModel.phone,
        'email': userModel.email,
        'id': userModel.id,
        'imageProfile':
            'https://e7.pngegg.com/pngimages/647/460/png-clipart-computer-icons-open-person-family-icon-black-silhouette-black-thumbnail.png',
      });
      return right(null);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }
}
