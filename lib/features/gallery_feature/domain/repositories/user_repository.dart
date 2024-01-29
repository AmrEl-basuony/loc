import 'package:loc/core/resources/data_state.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';

abstract class UserRepository {
  Future<DataState<List<UserModel>>> getUsers();
}
