import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/modules/home/usecases/get_all_pokemons.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/interfaces.dart';

class PokemonRepositoryMock extends Mock implements IPokemonRepository {}

void main() {
  final repository = PokemonRepositoryMock();
  final usecase = GetAllPokemons(repository);

  test("Deve retornar a lista de pokemons com sucesso.", () async {
    final page = 0;

    when(
      () => repository.findAll(page),
    ).thenAnswer(
      (_) async => Right(<PokemonListResponseDTO>[]),
    );

    final result = await usecase.execute(page);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<PokemonListResponseDTO>>());
  });

  test("Deve retornar um erro se a page for menor que 0.", () async {
    final page = -1;

    when(
      () => repository.findAll(page),
    ).thenAnswer(
      (_) async => Left(AppException("usecase error")),
    );

    final result = await usecase.execute(page);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });
}
