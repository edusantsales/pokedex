import 'dart:convert';

import 'dtos.dart';

class PokemonResponseDTO {
  List<AbilitiesResponseDTO>? abilities;
  int? baseExperience;
  int? height;
  int? id;
  bool? isDefault;
  String? name;
  int? order;
  AbilityResponseDTO? species;
  SpritesResponseDTO? sprites;
  List<StatsResponseDTO>? stats;
  List<TypesResponseDTO>? types;
  int? weight;

  PokemonResponseDTO({
    this.abilities,
    this.baseExperience,
    this.height,
    this.id,
    this.isDefault,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonResponseDTO.fromMap(Map<String, dynamic> map) {
    return PokemonResponseDTO(
      abilities: List<AbilitiesResponseDTO>.from(
        map['abilities']?.map(
          (x) => AbilitiesResponseDTO.fromMap(x),
        ),
      ),
      baseExperience: map['base_experience'],
      height: map['height'],
      id: map['id'],
      isDefault: map['is_default'],
      name: map['name'],
      order: map['order'],
      species: AbilityResponseDTO.fromMap(map['species']),
      sprites: SpritesResponseDTO.fromMap(map['sprites']),
      stats: List<StatsResponseDTO>.from(
        map['stats']?.map(
          (x) => StatsResponseDTO.fromMap(x),
        ),
      ),
      types: List<TypesResponseDTO>.from(
        map['types']?.map(
          (x) => TypesResponseDTO.fromMap(x),
        ),
      ),
      weight: map['weight'],
    );
  }

  factory PokemonResponseDTO.fromJson(String source) =>
      PokemonResponseDTO.fromMap(json.decode(source));
}
