import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';

typedef FutureEitherPokemons
    = Future<Either<AppException, List<PokemonListResponseDTO>>>;
typedef FutureEitherPokemon = Future<Either<AppException, PokemonResponseDTO>>;
typedef FutureEitherSpecie = Future<Either<AppException, SpecieResponseDTO>>;

abstract class IPokemonRepository {
  FutureEitherPokemons findAll(int page);
  FutureEitherPokemon findOne({String? pokemonId, String? pokemonName});
  FutureEitherSpecie getSpecie(String pokemonId);
}
