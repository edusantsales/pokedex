import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/shared/entities/entities.dart';
import 'package:pokedex/app/shared/services/services.dart';
import 'package:rx_notifier/rx_notifier.dart';

class FavoriteViewModel {
  final _localStorage = Modular.get<LocalStorageService>();

  var pokemons = RxList(<Pokemon>[]);
  var loadingWidget = RxNotifier<Widget>(
    Center(child: CircularProgressIndicator()),
  );

  void getFavoritesPokemon() async {
    var favorites = await _localStorage.getList("favorites");
    var favoritesPokemons = <Pokemon>[];
    favorites?.forEach((element) {
      favoritesPokemons.add(Pokemon.fromJson(element));
    });
    pokemons.addAll(favoritesPokemons);
    pokemons.sort((a, b) => a.id.compareTo(b.id));
  }

  void loading() {
    Future<Widget>.delayed(
      Duration(seconds: 5),
      () => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Text(
          "Você não possui nenhum pokemon favorito treinador. =(",
          style: AppTextStyles.textBlack(14),
        ),
      ),
    ).then((value) => loadingWidget.value = value);
  }

  VoidCallback loadDetailPage(int index, Pokemon pokemon) {
    var pokemap = {"index": index, "pokemon": pokemon, "pokemons": pokemons};
    return () {
      Modular.to.pushNamed("/pokemon", arguments: pokemap);
    };
  }

  VoidCallback loadHomePage() {
    return () {
      Modular.to.pop();
    };
  }
}
