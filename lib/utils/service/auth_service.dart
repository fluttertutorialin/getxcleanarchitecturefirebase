import 'package:get/get.dart';
import '../../data/providers/local/storage_provider.dart';

class AuthService extends GetxService {
  final StorageProvider _storageProvider = Get.find();

  bool hasLogin() => true;
}
