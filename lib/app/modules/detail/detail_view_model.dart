import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/entities/entities.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'usecases/get_specie.dart';

class DetailViewModel {
  final _getSpecie = Modular.get<GetSpecie>();

  var pokemonIndex = 0;
  var pokemon = RxNotifier(
    Pokemon(
      id: 0,
      abilites: [],
      baseExperience: 0,
      height: 0,
      imageUrl: "",
      isDefault: false,
      name: "",
      order: 0,
      stats: [],
      types: [],
      weight: 0,
    ),
  );
  var pokemons = RxList(<Pokemon>[]);
  var specie = RxNotifier(
    Specie(
      id: 0,
      description: "",
      evolvesFromSpecie: "",
      generation: "",
      growthRate: "",
      habitat: "",
      isLegendary: false,
      isMythical: false,
      name: "",
      order: 0,
    ),
  );
  var error = RxNotifier(none<AppException>());

  VoidCallback loadHomePage() {
    return () {
      Modular.to.pop();
    };
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  void getPokemonSpecieInfo(String pokemonId) async {
    var result = await _getSpecie.execute(pokemonId);
    result.fold((e) {
      error.value = optionOf(e);
    }, (response) {
      specie.value = Specie(
        id: response.id!,
        description: response.flavorTextEntries!
            .where(
              (element) => (element.language.name == "en" &&
                  element.version.name == "firered"),
            )
            .first
            .flavorText
            .replaceAll("\n", " "),
        evolvesFromSpecie: response.evolvesFromSpecies!.name,
        generation: response.generation!.name,
        growthRate: response.growthRate!.name,
        habitat: response.habitat!.name,
        isLegendary: response.isLegendary!,
        isMythical: response.isMythical!,
        name: response.name!,
        order: response.order!,
      );
    });
  }

  String getFormattedString(String value) {
    return value.replaceFirst(
      value.characters.first,
      value.characters.first.toUpperCase(),
      0,
    );
  }

  int getPokemonTotalStatus(List<int> stats) {
    var total = 0;
    stats.forEach((status) {
      total += status;
    });
    return total;
  }
}
