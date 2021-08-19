import 'dart:convert';

import 'dtos.dart';

class SpritesResponseDTO {
  OtherResponseDTO other;

  SpritesResponseDTO({required this.other});

  factory SpritesResponseDTO.fromMap(Map<String, dynamic> map) {
    return SpritesResponseDTO(
      other: OtherResponseDTO.fromMap(
        map['other'],
      ),
    );
  }

  factory SpritesResponseDTO.fromJson(String source) =>
      SpritesResponseDTO.fromMap(json.decode(source));
}
