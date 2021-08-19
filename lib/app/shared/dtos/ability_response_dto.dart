import 'dart:convert';

class AbilityResponseDTO {
  String name;
  String url;

  AbilityResponseDTO({required this.name, required this.url});

  factory AbilityResponseDTO.fromMap(Map<String, dynamic> map) {
    return AbilityResponseDTO(
      name: map['name'],
      url: map['url'],
    );
  }

  factory AbilityResponseDTO.fromJson(String source) =>
      AbilityResponseDTO.fromMap(json.decode(source));
}
