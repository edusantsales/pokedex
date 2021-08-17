import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/shared/entities/entities.dart';
import 'package:rx_notifier/rx_notifier.dart';

class DetailViewModel {
  var pokemonIndex = 0;
  var pokemon = RxNotifier(
    Pokemon(id: 0, imageUrl: "", name: "", types: []),
  );
  var pokemons = RxList(<Pokemon>[]);

  VoidCallback loadHomePage() {
    return () {
      Modular.to.pop();
    };
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }
}
