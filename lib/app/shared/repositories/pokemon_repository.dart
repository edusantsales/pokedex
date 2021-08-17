import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/app/shared/dtos/dtos.dart';
import 'package:pokedex/app/shared/exceptions/exceptions.dart';
import 'package:pokedex/app/shared/interfaces/ipokemon_repository.dart';
import 'package:pokedex/env.dart';

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio) {
    if (this.dio.options.baseUrl.isEmpty) {
      dio.options.baseUrl = POKE_API;
    }
  }

  @override
  FutureEitherPokemons findAll(int page) async {
    List<PokemonListResponseDTO> result = [];
    try {
      final response = await dio.get("/pokemon/?limit=20&offset=$page");
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.partialContent) {
        result = (response.data['results'] as List)
            .map((e) => PokemonListResponseDTO.fromMap(e))
            .toList();
      }
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 300) {
        return Left(
          AppException(
            "Erro ao tentar listar todos os pokemons.",
            statusCode: e.response!.statusCode,
            statusMessage: e.response!.statusMessage,
          ),
        );
      }
    }
    return result.isEmpty
        ? Left(AppException("Nenhum pokemon foi retornado da api."))
        : Right(result);
  }

  @override
  FutureEitherPokemon findOne({String? pokemonId, String? pokemonName}) async {
    PokemonResponseDTO? result;
    try {
      final response = await dio.get("/pokemon/${pokemonId ?? pokemonName}");
      if (response.statusCode == HttpStatus.ok) {
        result = PokemonResponseDTO.fromMap(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 300) {
        return Left(
          AppException(
            "Erro ao tentar consultar um pokemon.",
            statusCode: e.response!.statusCode,
            statusMessage: e.response!.statusMessage,
          ),
        );
      }
    }
    return result == null
        ? Left(AppException("Nenhum pokemon foi retornado da api."))
        : Right(result);
  }
}
