import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/modules/home/usecases/get_pokemon.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/interfaces.dart';

class HomeRepositoryMock extends Mock implements IPokemonRepository {}

void main() {
  final repository = HomeRepositoryMock();
  final usecase = GetPokemon(repository);

  test("Deve retornar um pokemon informando o seu id.", () async {
    final pokemonId = "1";

    when(
      () => repository.findOne(pokemonId: pokemonId),
    ).thenAnswer(
      (_) async => Right(PokemonResponseDTO()),
    );

    final result = await usecase.execute(pokemonId: pokemonId);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<PokemonResponseDTO>());
  });

  test("Deve retornar um pokemon informando o seu nome.", () async {
    final pokemonName = "bulbasaur";

    when(
      () => repository.findOne(pokemonName: pokemonName),
    ).thenAnswer(
      (_) async => Right(PokemonResponseDTO()),
    );

    final result = await usecase.execute(pokemonName: pokemonName);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<PokemonResponseDTO>());
  });

  test("Deve retornar um erro se o id for nulo.", () async {
    final pokemonId = null;

    when(
      () => repository.findOne(pokemonId: pokemonId),
    ).thenAnswer(
      (_) async => Left(AppException("usecase error")),
    );

    final result = await usecase.execute(pokemonId: pokemonId);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });

  test("Deve retornar um erro se o id estiver em branco.", () async {
    final pokemonId = "";

    when(
      () => repository.findOne(pokemonId: pokemonId),
    ).thenAnswer(
      (_) async => Left(AppException("usecase error")),
    );

    final result = await usecase.execute(pokemonId: pokemonId);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });

  test("Deve retornar um erro se o nome for nulo.", () async {
    final pokemonName = null;

    when(
      () => repository.findOne(pokemonName: pokemonName),
    ).thenAnswer(
      (_) async => Left(AppException("usecase error")),
    );

    final result = await usecase.execute(pokemonName: pokemonName);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });

  test("Deve retornar um erro se o nome estiver em branco.", () async {
    final pokemonName = "";

    when(
      () => repository.findOne(pokemonName: pokemonName),
    ).thenAnswer(
      (_) async => Left(AppException("usecase error")),
    );

    final result = await usecase.execute(pokemonName: pokemonName);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });
}
