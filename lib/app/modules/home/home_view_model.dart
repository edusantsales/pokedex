import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/entities/entities.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'usecases/get_all_pokemons.dart';
import 'usecases/get_pokemon.dart';

class HomeViewModel {
  final _getAllPokemons = Modular.get<GetAllPokemons>();
  final _getPokemon = Modular.get<GetPokemon>();

  var page = 0;
  var pokemons = RxList(<Pokemon>[]);
  var error = RxNotifier(none<AppException>());
  var loadingWidget = RxNotifier<Widget>(
    Center(child: CircularProgressIndicator()),
  );

  void getPokemons() async {
    var result = await _getAllPokemons.execute(page);
    result.fold((e) {
      error.value = optionOf(e);
    }, (response) {
      addPokemon(response);
    });
  }

  Future<PokemonResponseDTO> getPokemonDetail(String name) async {
    var pokemonResponseDTO;
    var result = await _getPokemon.execute(pokemonName: name);
    result.fold((e) {
      error.value = optionOf(e);
    }, (response) {
      pokemonResponseDTO = response;
    });
    return pokemonResponseDTO;
  }

  void addPokemon(List<PokemonListResponseDTO> pokemonsDTO) async {
    for (var pokemonDTO in pokemonsDTO) {
      var result = await getPokemonDetail(pokemonDTO.name);
      var pokemon = Pokemon(
        id: result.id!,
        name: result.name!,
        image: Image.network(
          result.sprites!.other.officialArtwork.frontDefault,
        ),
        types: result.types!.map((e) => e.type.name).toList(),
      );
      if (!pokemons.contains(pokemon.id)) {
        pokemons.add(pokemon);
      }
    }
    pokemons.sort((a, b) => a.id.compareTo(b.id));
  }

  void nextPage() {
    page = page + 20;
    this.getPokemons();
  }

  void showSnackBar(BuildContext context, AppException e) {
    var statusCode = e.statusCode;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.error,
        content: statusCode != null
            ? Text("${e.message} Código: $statusCode")
            : Text(e.message),
        duration: Duration(seconds: 10),
      ),
    );
  }

  void loading() {
    Future<Widget>.delayed(
      Duration(seconds: 15),
      () => Container(
        alignment: Alignment.center,
        child: Text(
          "Sua pokedex está vazia treinador. =(",
          style: AppTextStyles.textBlack(14),
        ),
      ),
    ).then((value) => loadingWidget.value = value);
  }
}
