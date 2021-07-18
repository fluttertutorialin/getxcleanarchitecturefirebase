import '../../../base/domain/base_usecase.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repo.dart';

class RegisterEmailInput {
  RegisterEmailInput(this.username, this.password);
  final String username;
  final String password;
}

class RegisterByEmailUseCase extends UseCaseIO<RegisterEmailInput, User> {
  RegisterByEmailUseCase(this.authRepo);

  final AuthRepo authRepo;

  @override
  Future<User> build(RegisterEmailInput input) {
    return authRepo.registerByEmail(input);
  }
}

class SendEmailVerificationUseCase extends UseCaseO<bool> {
  SendEmailVerificationUseCase(this.authRepo);

  final AuthRepo authRepo;

  @override
  Future<bool> build() {
    return authRepo.sendEmailVerification();
  }
}
