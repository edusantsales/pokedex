import 'dart:convert';

import 'dtos.dart';

class OtherResponseDTO {
  OfficialArtworkResponseDTO officialArtwork;

  OtherResponseDTO({required this.officialArtwork});

  factory OtherResponseDTO.fromMap(Map<String, dynamic> map) {
    return OtherResponseDTO(
      officialArtwork: OfficialArtworkResponseDTO.fromMap(
        map['official-artwork'],
      ),
    );
  }

  factory OtherResponseDTO.fromJson(String source) =>
      OtherResponseDTO.fromMap(json.decode(source));
}
