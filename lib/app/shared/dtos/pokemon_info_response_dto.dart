import 'dart:convert';

class PokemonInfoResponseDTO {
  String name;
  String url;

  PokemonInfoResponseDTO({required this.name, required this.url});

  factory PokemonInfoResponseDTO.fromMap(Map<String, dynamic> map) {
    return PokemonInfoResponseDTO(
      name: map['name'],
      url: map['url'],
    );
  }

  factory PokemonInfoResponseDTO.fromJson(String source) =>
      PokemonInfoResponseDTO.fromMap(json.decode(source));
}
