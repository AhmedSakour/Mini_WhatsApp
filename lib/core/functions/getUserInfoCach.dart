import 'package:hive/hive.dart';
import 'package:whats_app/core/constant/hive_boxes.dart';
import 'package:whats_app/features/auth/data/models/user_model.dart';

class UserInfoCache {
  static Future<String> getUserName() async {
    final user = await getUserInfo();
    return user!.name;
  }

  static Future<String> getUserId() async {
    final user = await getUserInfo();
    return user!.id;
  }

  static Future<String> getUserEmail() async {
    final user = await getUserInfo();
    return user!.email;
  }

  static Future<String> getUserPhone() async {
    final user = await getUserInfo();
    return user!.phone;
  }

  static Future<UserModel?> getUserInfo() async {
    final box = Hive.box<UserModel>(kUserInfo);

    if (box.isEmpty) {
      return null;
    }
    return box.values.last;
  }
}
