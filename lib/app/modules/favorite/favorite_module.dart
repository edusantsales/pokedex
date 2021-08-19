import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/favorite/favorite_view_model.dart';
import 'package:pokedex/app/modules/favorite/pages/favorite_page.dart';

class FavoriteModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      Bind.lazySingleton((i) => FavoriteViewModel()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        "/",
        child: (context, args) => FavoritePage(),
      ),
    ];
  }
}
