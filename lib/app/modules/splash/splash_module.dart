import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/splash/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        "/",
        child: (context, args) => SplashPage(),
      ),
    ];
  }
}
