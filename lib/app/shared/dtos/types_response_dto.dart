import 'dart:convert';

import 'dtos.dart';

class TypesResponseDTO {
  int slot;
  AbilityResponseDTO type;

  TypesResponseDTO({required this.slot, required this.type});

  factory TypesResponseDTO.fromMap(Map<String, dynamic> map) {
    return TypesResponseDTO(
      slot: map['slot'],
      type: AbilityResponseDTO.fromMap(map['type']),
    );
  }

  factory TypesResponseDTO.fromJson(String source) =>
      TypesResponseDTO.fromMap(json.decode(source));
}
