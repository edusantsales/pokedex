import 'dart:convert';

class PokemonListResponseDTO {
  String name;
  String url;

  PokemonListResponseDTO({required this.name, required this.url});

  factory PokemonListResponseDTO.fromMap(Map<String, dynamic> map) {
    return PokemonListResponseDTO(
      name: map['name'],
      url: map['url'],
    );
  }

  factory PokemonListResponseDTO.fromJson(String source) =>
      PokemonListResponseDTO.fromMap(json.decode(source));
}
