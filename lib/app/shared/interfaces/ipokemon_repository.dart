import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';

typedef FutureEitherPokemons
    = Future<Either<AppException, List<PokemonListResponseDTO>>>;
typedef FutureEitherPokemon = Future<Either<AppException, PokemonResponseDTO>>;

abstract class IPokemonRepository {
  FutureEitherPokemons findAll(int page);
  FutureEitherPokemon findOne({String? pokemonId, String? pokemonName});
}
