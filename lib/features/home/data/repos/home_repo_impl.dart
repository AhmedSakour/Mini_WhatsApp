import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failures.dart';
import 'package:whats_app/core/functions/getUserInfoCach.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';
import 'package:whats_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<UserModel>>> getUsers(
      List<UserModel> users) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('users').get();

      for (var element in data.docs) {
        if (await UserInfoCache.getUserId() != element.get('id')) {
          users.add(UserModel(
              name: element.get('name'),
              email: element.get('email'),
              password: element.get('password'),
              phone: element.get('phone'),
              imageProfile: element.get('imageProfile'),
              id: element.get('id')));
        }
      }
      return right(users);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreError(e));
      } else {
        return left(FirestoreFailure(e.toString()));
      }
    }
  }
}
