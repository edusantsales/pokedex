import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/detail/detail_module.dart';

import 'modules/favorite/favorite_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';
import 'settings/constants/constants.dart';
import 'shared/services/local_storage_service.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      Bind.lazySingleton((i) => LocalStorageService()),
      Bind.lazySingleton(
        (i) => Dio(BaseOptions(baseUrl: POKE_API)),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute("/", module: SplashModule()),
      ModuleRoute("/home", module: HomeModule()),
      ModuleRoute("/favorite", module: FavoriteModule()),
      ModuleRoute("/pokemon", module: DetailModule()),
    ];
  }
}
