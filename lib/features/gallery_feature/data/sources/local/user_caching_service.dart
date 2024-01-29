import 'package:hive_flutter/hive_flutter.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';

class UserCachingService {
  static List<UserModel?> getUsers() {
    
    
    final values = Hive.box<UserModel>('users').values.toList();



    return values;
  }

  static Future<void> deleteUsers() async {
    await Hive.box<UserModel>('users').clear();
  }

  static Future<void> addUsers(List<UserModel> users) async {
    await Hive.box<UserModel>('users').addAll(users);
  }
}
