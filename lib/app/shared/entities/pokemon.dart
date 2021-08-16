import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final Widget image;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
  });

  String getFormattedName() {
    return this.name.replaceFirst(
          this.name.characters.first,
          this.name.characters.first.toUpperCase(),
          0,
        );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon &&
        other.id == id &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
