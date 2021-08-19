import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/detail/detail_view_model.dart';

import 'pages/detail_page.dart';

class DetailModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      Bind.lazySingleton((i) => DetailViewModel()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        "/",
        child: (context, args) => DetailPage(pokemap: args.data),
      ),
    ];
  }
}
