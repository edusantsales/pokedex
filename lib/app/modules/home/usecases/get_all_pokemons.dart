import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/ipokemon_repository.dart';

class GetAllPokemons {
  final IPokemonRepository _repository;

  GetAllPokemons(this._repository);

  FutureEitherPokemons execute(int page) async {
    if (page < 0) {
      return Left(AppException("A página informada é inválida."));
    }
    return _repository.findAll(page);
  }
}
