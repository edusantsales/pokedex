import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'shared/services/local_storage_service.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      Bind.lazySingleton((i) => LocalStorageService()),
      Bind.lazySingleton((i) => Dio()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      // ModuleRoute("/", module: SplashModule()),
      ModuleRoute("/", module: HomeModule()),
    ];
  }
}
