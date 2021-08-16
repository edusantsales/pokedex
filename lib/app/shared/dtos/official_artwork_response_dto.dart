import 'dart:convert';

class OfficialArtworkResponseDTO {
  String frontDefault;

  OfficialArtworkResponseDTO({required this.frontDefault});

  factory OfficialArtworkResponseDTO.fromMap(Map<String, dynamic> map) {
    return OfficialArtworkResponseDTO(
      frontDefault: map['front_default'],
    );
  }

  factory OfficialArtworkResponseDTO.fromJson(String source) =>
      OfficialArtworkResponseDTO.fromMap(json.decode(source));
}
