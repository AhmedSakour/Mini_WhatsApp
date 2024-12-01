import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String id;
  @HiveField(5)
  String? imageProfile;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.id,
      this.imageProfile});
}
