import '../../data/models/user_model.dart';
import '../entities/user.dart';
import '../usecases/auth/login_uc.dart';
import '../usecases/auth/register_uc.dart';

abstract class AuthRepo {
  Future<User> loginByGoogle();
  Future<User> loginByEmail(LoginEmailInput input);

  Future<User> registerByEmail(RegisterEmailInput input);
  Future<bool> sendEmailVerification();

  Future<bool> logOut();

  Future<Stream<List<UserModel>>> getAllUserStream();
}
