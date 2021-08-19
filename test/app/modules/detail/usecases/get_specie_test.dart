import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/modules/detail/usecases/get_specie.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/interfaces.dart';

class PokemonRepositoryMock extends Mock implements IPokemonRepository {}

void main() {
  final repository = PokemonRepositoryMock();
  final usecase = GetSpecie(repository);
  test("Deve retornar um pokemon informando o seu id.", () async {
    final pokemonId = "1";

    when(
      () => repository.getSpecie(pokemonId),
    ).thenAnswer(
      (_) async => Right(SpecieResponseDTO()),
    );

    final result = await usecase.execute(pokemonId);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<SpecieResponseDTO>());
  });

  test("Deve retornar um erro se o id estiver em branco.", () async {
    final pokemonId = "";

    when(
      () => repository.getSpecie(pokemonId),
    ).thenAnswer(
      (_) async => Left(AppException("usecase error")),
    );

    final result = await usecase.execute(pokemonId);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<AppException>());
  });
}
