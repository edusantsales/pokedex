import 'dart:convert';

import 'dtos.dart';

class StatsResponseDTO {
  int baseStat;
  int effort;
  AbilityResponseDTO stat;

  StatsResponseDTO({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatsResponseDTO.fromMap(Map<String, dynamic> map) {
    return StatsResponseDTO(
      baseStat: map['base_stat'],
      effort: map['effort'],
      stat: AbilityResponseDTO.fromMap(map['stat']),
    );
  }

  factory StatsResponseDTO.fromJson(String source) =>
      StatsResponseDTO.fromMap(json.decode(source));
}
