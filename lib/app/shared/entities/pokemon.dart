import 'dart:convert';

import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final List<String> abilites;
  final int baseExperience;
  final int height;
  final String imageUrl;
  final bool isDefault;
  bool isFavorite;
  final String name;
  final int order;
  final List<int> stats;
  final List<String> types;
  final int weight;

  Pokemon({
    required this.id,
    required this.abilites,
    required this.baseExperience,
    required this.height,
    required this.imageUrl,
    required this.isDefault,
    this.isFavorite = false,
    required this.name,
    required this.order,
    required this.stats,
    required this.types,
    required this.weight,
  });

  String getFormattedString(String value) {
    return value.replaceFirst(
      value.characters.first,
      value.characters.first.toUpperCase(),
      0,
    );
  }

  double getFormattedHeightWeight(int value) {
    var result = (value / 10.0);
    return result;
  }

  String getFormattedList(List<String> values) {
    late String result = "";
    values.forEach((element) {
      var formattedString = getFormattedString(element) + ", ";
      result += formattedString;
    });
    return result;
  }

  Color? getColorType() {
    switch (getFormattedString(this.types.first)) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.grey[800];
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'abilites': abilites,
      'baseExperience': baseExperience,
      'height': height,
      'imageUrl': imageUrl,
      'isDefault': isDefault,
      'isFavorite': isFavorite,
      'name': name,
      'order': order,
      'stats': stats,
      'types': types,
      'weight': weight,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      abilites: List<String>.from(map['abilites']),
      baseExperience: map['baseExperience'],
      height: map['height'],
      imageUrl: map['imageUrl'],
      isDefault: map['isDefault'],
      isFavorite: map['isFavorite'],
      name: map['name'],
      order: map['order'],
      stats: List<int>.from(map['stats']),
      types: List<String>.from(map['types']),
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source));
}
