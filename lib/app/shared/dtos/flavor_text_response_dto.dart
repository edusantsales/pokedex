import 'dart:convert';

import 'package:pokedex/app/shared/dtos/pokemon_info_response_dto.dart';

class FlavorTextResponseDTO {
  String flavorText;
  PokemonInfoResponseDTO language;
  PokemonInfoResponseDTO version;

  FlavorTextResponseDTO({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextResponseDTO.fromMap(Map<String, dynamic> map) {
    return FlavorTextResponseDTO(
      flavorText: map['flavor_text'],
      language: PokemonInfoResponseDTO.fromMap(map['language']),
      version: PokemonInfoResponseDTO.fromMap(map['version']),
    );
  }

  factory FlavorTextResponseDTO.fromJson(String source) =>
      FlavorTextResponseDTO.fromMap(json.decode(source));
}
