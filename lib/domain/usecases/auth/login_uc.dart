import '../../../base/domain/base_usecase.dart';
import '../../../data/models/user_model.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repo.dart';

class LoginEmailInput {
  LoginEmailInput(this.username, this.password);

  final String username;
  final String password;
}

class LoginByEmailUseCase extends UseCaseIO<LoginEmailInput, User> {
  LoginByEmailUseCase(this.authRepo);

  final AuthRepo authRepo;

  @override
  Future<User> build(LoginEmailInput input) {
    return authRepo.loginByEmail(input);
  }
}

class LoginByGoogleUseCase extends UseCaseO<Stream<List<UserModel>>> {
  LoginByGoogleUseCase(this.authRepo);

  final AuthRepo authRepo;

  @override
  Future<Stream<List<UserModel>>> build() {
    return authRepo.getAllUserStream();
  }
}
