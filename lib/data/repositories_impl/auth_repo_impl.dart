import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../providers/firestore/user_provider.dart';
import '../providers/local/storage_provider.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/auth/login_uc.dart';
import '../../domain/usecases/auth/register_uc.dart';
import '../../utils/service/log_service.dart';

class AuthRepoImpl implements AuthRepo {
  final StorageProvider _storageProvider = Get.find();
  final UserProvider _userProvider = Get.find();

  @override
  Future<bool> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<User> loginByEmail(LoginEmailInput input) async {
    await Future.delayed(const Duration(seconds: 1));

    // TODO: implement loginByEmail
    throw UnimplementedError();
  }

  @override
  Future<User> loginByGoogle() async {
    final UserModel? u = await _userProvider.getUser("5vtCd1riuSP2wQaYSfWB");
    Log.debug(u);
    final List<UserModel> us = await _userProvider.getAllUser();
    Log.debug(us);
    return JsonMapper.deserialize<User>(JsonMapper.serialize(u))!;

    // TODO: implement loginByGoogle
    throw UnimplementedError();
  }

  @override
  Future<User> registerByEmail(RegisterEmailInput input) {
    // TODO: implement registerByEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<Stream<List<UserModel>>> getAllUserStream() async {
    Stream<List<UserModel>> ll = _userProvider.getAllUserStream();
    return ll;
  }
}
