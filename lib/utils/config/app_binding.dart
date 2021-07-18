import 'package:get/get.dart';
import '../../data/providers/firestore/user_provider.dart';
import '../../data/providers/local/storage_provider.dart';
import '../../data/repositories_impl/auth_repo_impl.dart';
import '../service/auth_service.dart';
import '../service/connectivity_service.dart';
import '../service/log_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectStorageProvider();
    injectFirestoreProvider();
    injectRepository();
    injectService();
  }

  void injectStorageProvider() {
    Get.put(StorageProvider());
  }

  void injectFirestoreProvider() {
    Get.lazyPut(() => UserProvider(), fenix: true);
  }

  void injectRepository() {
    Get.put(AuthRepoImpl());
  }

  void injectService() {
    Get.put(LogService());
    Get.put(AuthService());
    Get.put(ConnectivityService());
  }
}
