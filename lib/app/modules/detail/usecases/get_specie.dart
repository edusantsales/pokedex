import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/interfaces.dart';
import 'package:pokedex/app/shared/utils/utils.dart';

class GetSpecie {
  final IPokemonRepository _repository;

  GetSpecie(this._repository);

  FutureEitherSpecie execute(String pokemonId) async {
    if (StringUtils.isBlank(pokemonId)) {
      return Left(AppException("Informe o id do pokemon."));
    }
    return _repository.getSpecie(pokemonId);
  }
}
