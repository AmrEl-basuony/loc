import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loc/features/gallery_feature/data/repositories/user_repository_impl.dart';
import 'package:loc/features/gallery_feature/data/sources/remote/user_api_service.dart';
import 'package:loc/features/gallery_feature/domain/repositories/user_repository.dart';
import 'package:loc/features/gallery_feature/domain/usecases/get_user_usecase.dart';
import 'package:loc/features/gallery_feature/presentaion/cubit/user/remote/cubit/remote_user_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<UserApiService>(UserApiService(getIt()));

  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(getIt()));

  getIt.registerSingleton<GetUserUseCase>(GetUserUseCase(getIt()));

  getIt.registerFactory<RemoteUserCubit>(() => RemoteUserCubit(getIt()));
}
