import 'dart:convert';

import 'package:pokedex/app/shared/dtos/evolution_chain_response_dto.dart';
import 'package:pokedex/app/shared/dtos/flavor_text_response_dto.dart';
import 'package:pokedex/app/shared/dtos/pokemon_info_response_dto.dart';

class SpecieResponseDTO {
  int? baseHappiness;
  int? captureRate;
  EvolutionChainResponseDTO? evolutionChain;
  PokemonInfoResponseDTO? evolvesFromSpecies;
  List<FlavorTextResponseDTO>? flavorTextEntries;
  bool? formsSwitchable;
  PokemonInfoResponseDTO? generation;
  PokemonInfoResponseDTO? growthRate;
  PokemonInfoResponseDTO? habitat;
  int? id;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  int? order;

  SpecieResponseDTO({
    this.baseHappiness,
    this.captureRate,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formsSwitchable,
    this.generation,
    this.growthRate,
    this.habitat,
    this.id,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.order,
  });

  factory SpecieResponseDTO.fromMap(Map<String, dynamic> map) {
    var evolvesFromSpeciesResult = map['evolves_from_species'] == null
        ? PokemonInfoResponseDTO(name: "", url: "")
        : PokemonInfoResponseDTO.fromMap(map['evolves_from_species']);

    return SpecieResponseDTO(
      baseHappiness: map['base_happiness'],
      captureRate: map['capture_rate'],
      evolutionChain: EvolutionChainResponseDTO.fromMap(map['evolution_chain']),
      evolvesFromSpecies: evolvesFromSpeciesResult,
      flavorTextEntries: List<FlavorTextResponseDTO>.from(
          map['flavor_text_entries']
              ?.map((x) => FlavorTextResponseDTO.fromMap(x))),
      formsSwitchable: map['forms_switchable'],
      generation: PokemonInfoResponseDTO.fromMap(map['generation']),
      growthRate: PokemonInfoResponseDTO.fromMap(map['growth_rate']),
      habitat: PokemonInfoResponseDTO.fromMap(map['habitat']),
      id: map['id'],
      isLegendary: map['is_legendary'],
      isMythical: map['is_mythical'],
      name: map['name'],
      order: map['order'],
    );
  }

  factory SpecieResponseDTO.fromJson(String source) =>
      SpecieResponseDTO.fromMap(json.decode(source));
}
