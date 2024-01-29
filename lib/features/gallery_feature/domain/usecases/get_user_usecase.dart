import 'package:loc/core/resources/data_state.dart';
import 'package:loc/core/usecase/usecase.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';
import 'package:loc/features/gallery_feature/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<DataState<List<UserModel>>, void> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<DataState<List<UserModel>>> call({void params}) {
    
    return _userRepository.getUsers();
  }
}
