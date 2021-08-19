import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/repositories/repositories.dart';
import 'package:pokedex/env.dart';

void main() {
  final dio = Dio(BaseOptions(baseUrl: POKE_API));
  final repository = PokemonRepository(dio);

  test("Deve retornar os 20 primeiros pokemons da lista.", () async {
    final result = await repository.findAll(0);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<PokemonListResponseDTO>>());
  });

  test("Deve retornar um pokemon ao informar um id.", () async {
    final result = await repository.findOne(pokemonId: "1");
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<PokemonResponseDTO>());
  });

  test("Deve retornar um pokemon ao informar um nome.", () async {
    final result = await repository.findOne(pokemonId: "bulbasaur");
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<PokemonResponseDTO>());
  });

  test("Deve retornar as informações da espécie ao informar um id.", () async {
    final result = await repository.getSpecie("1");
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<SpecieResponseDTO>());
  });

  test("Deve retornar um erro ao informar uma página menor que 0.", () async {
    final result = await repository.findAll(-1);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });

  test("Deve retornar um erro ao informar um id menor ou igual a 0.", () async {
    final result = await repository.findOne(pokemonId: "0");
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });

  test("Deve retornar um erro ao informar um nome errado.", () async {
    final result = await repository.findOne(pokemonName: "bulbasau");
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });
}
