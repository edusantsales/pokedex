import 'dart:convert';

class EvolutionChainResponseDTO {
  String url;

  EvolutionChainResponseDTO({required this.url});

  factory EvolutionChainResponseDTO.fromMap(Map<String, dynamic> map) {
    return EvolutionChainResponseDTO(
      url: map['url'],
    );
  }

  factory EvolutionChainResponseDTO.fromJson(String source) =>
      EvolutionChainResponseDTO.fromMap(json.decode(source));
}
