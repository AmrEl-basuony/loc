import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:loc/features/gallery_feature/presentaion/cubit/user/remote/cubit/remote_user_cubit.dart';
import 'package:loc/features/gallery_feature/presentaion/widgets/users_list.dart';
import 'package:loc/injection_container.dart';

class UsersGalleryScreen extends StatelessWidget {
  const UsersGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteUserCubit>(
      create: (context) => getIt()..getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users gallery'),
        ),
        body: BlocBuilder<RemoteUserCubit, RemoteUserState>(
          builder: (context, state) {
            final RemoteUserCubit remoteUserCubit = RemoteUserCubit.getInstance(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: LiquidPullToRefresh(
                onRefresh: remoteUserCubit.getUsers,
                child: state is RemoteUserLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : state is RemoteUserError
                        ? Center(
                            child: Column(
                              children: [
                                Text("Try again\nError: ${state.error?.message}"),
                                OutlinedButton(
                                  onPressed: remoteUserCubit.getUsers,
                                  child: Text("Reload"),
                                ),
                              ],
                            ),
                          )
                        : state is RemoteUserSuccess
                            ? UsersList(users: remoteUserCubit.users)
                            : Center(
                                child: Column(
                                  children: [
                                    Text("Try again\nUnexpected error}"),
                                    OutlinedButton(
                                      onPressed: remoteUserCubit.getUsers,
                                      child: Text("Reload"),
                                    ),
                                  ],
                                ),
                              ),
              ),
            );
          },
        ),
      ),
    );
  }
}
