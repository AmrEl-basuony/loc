import 'dart:io';

import 'package:dio/dio.dart';
import 'package:loc/core/resources/data_state.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';
import 'package:loc/features/gallery_feature/data/sources/local/user_caching_service.dart';
import 'package:loc/features/gallery_feature/data/sources/remote/user_api_service.dart';
import 'package:loc/features/gallery_feature/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState<List<UserModel>>> getUsers() async {
    try {
      final httpResponse = await _userApiService.getUsers();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        await UserCachingService.deleteUsers().then((value) => UserCachingService.addUsers(httpResponse.data));
        
        return DataSuccess(httpResponse.data);
      } else {
        List<UserModel?> list = UserCachingService.getUsers();
        if (list.isEmpty) {
          return DataFailed(
            DioError(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioErrorType.badResponse,
              requestOptions: httpResponse.response.requestOptions,
            ),
          );
        } else {
          return DataSuccess(list as List<UserModel>);
        }
      }
    } on DioError catch (e) {
      List<UserModel?> list = UserCachingService.getUsers();
      if (list.isEmpty) {
        return DataFailed(e);
      }else{
        return DataSuccess(list as List<UserModel>);
      }
    }
  }
}
