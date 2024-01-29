part of 'remote_user_cubit.dart';

sealed class RemoteUserState extends Equatable {
  final List<UserModel> users;
  final DioError? error;

  const RemoteUserState({this.users = const [], this.error});

  @override
  List<Object> get props => [users, error!];
}

final class RemoteUserLoading extends RemoteUserState {
  const RemoteUserLoading();
}

final class RemoteUserSuccess extends RemoteUserState {
  const RemoteUserSuccess({super.users});
}

final class RemoteUserError extends RemoteUserState {
  const RemoteUserError({super.error});
}
