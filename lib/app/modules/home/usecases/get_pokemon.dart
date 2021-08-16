import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/ipokemon_repository.dart';
import 'package:pokedex/app/shared/utils/string_utils.dart';

class GetPokemon {
  final IPokemonRepository _repository;

  GetPokemon(this._repository);

  FutureEitherPokemon execute({String? pokemonId, String? pokemonName}) async {
    if (StringUtils.isNotBlank(pokemonId)) {
      return _repository.findOne(pokemonId: pokemonId);
    } else if (StringUtils.isNotBlank(pokemonName)) {
      return _repository.findOne(pokemonName: pokemonName);
    } else {
      return Left(AppException("Informe o id ou o nome do pokemon."));
    }
  }
}
