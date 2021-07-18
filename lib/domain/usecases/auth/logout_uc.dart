import '../../../base/domain/base_usecase.dart';
import '../../repositories/auth_repo.dart';

class LogoutUseCase extends UseCaseO<bool> {
  LogoutUseCase(this.authRepo);

  final AuthRepo authRepo;

  @override
  Future<bool> build() {
    return authRepo.logOut();
  }
}
