import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/home_view_model.dart';
import 'package:pokedex/app/shared/repositories/repositories.dart';

import 'pages/home_page.dart';
import 'usecases/get_all_pokemons.dart';
import 'usecases/get_pokemon.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      Bind.lazySingleton((i) => HomeViewModel()),
      Bind.lazySingleton((i) => GetAllPokemons(i())),
      Bind.lazySingleton((i) => GetPokemon(i())),
      Bind.lazySingleton((i) => PokemonRepository(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        "/",
        child: (context, args) => HomePage(),
      ),
    ];
  }
}
