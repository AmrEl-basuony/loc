import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc/core/resources/data_state.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';
import 'package:loc/features/gallery_feature/domain/usecases/get_user_usecase.dart';

part 'remote_user_state.dart';

class RemoteUserCubit extends Cubit<RemoteUserState> {
  final GetUserUseCase _getUserUseCase;
  RemoteUserCubit(this._getUserUseCase) : super(const RemoteUserLoading());

  static RemoteUserCubit getInstance(context) => BlocProvider.of<RemoteUserCubit>(context);

  List<UserModel> users = [];

  Future<void> getUsers() async {
    emit(const RemoteUserLoading());

    final response = await _getUserUseCase.call();
    if (response is DataSuccess) {
      users = response.data as List<UserModel>;

      emit(RemoteUserSuccess(users: users));
    } else if (response is DataFailed) {
      emit(RemoteUserError(error: response.error));
    }
  }
}
