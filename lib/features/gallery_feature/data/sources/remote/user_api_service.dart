import 'package:loc/core/constants.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: baseApiUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/users')
  Future<HttpResponse<List<UserModel>>> getUsers();
}
