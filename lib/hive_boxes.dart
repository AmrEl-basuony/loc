import 'package:hive_flutter/hive_flutter.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';

Future<void> openBoxes()async{
  await Hive.openBox<UserModel>('users');
}