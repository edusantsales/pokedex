import 'package:flutter/material.dart';
import 'package:pokedex/app/shared/entities/entities.dart';
import 'package:rx_notifier/rx_notifier.dart';

class DetailViewModel {
  var index = 0;
  var pokemon = RxNotifier(
    Pokemon(id: 0, image: Container(), name: "", types: []),
  );
  var pokemons = RxList(<Pokemon>[]);
}
