import 'dart:convert';

import 'dtos.dart';

class AbilitiesResponseDTO {
  AbilityResponseDTO ability;
  bool isHidden;
  int slot;

  AbilitiesResponseDTO({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilitiesResponseDTO.fromMap(Map<String, dynamic> map) {
    return AbilitiesResponseDTO(
      ability: AbilityResponseDTO.fromMap(map['ability']),
      isHidden: map['is_hidden'],
      slot: map['slot'],
    );
  }

  factory AbilitiesResponseDTO.fromJson(String source) =>
      AbilitiesResponseDTO.fromMap(json.decode(source));
}
