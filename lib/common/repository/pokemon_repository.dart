import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/common/constraints/api_constraints.dart';
import 'package:pokedex/common/exceptions/api_exceptions.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons(String? pokemonName);
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons(String? pokemonName) async {
    try {
      final response = await dio.get(ApiConstraints.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final data = json['pokemon'] as List<dynamic>;
      final dataFormated = data.map((e) => Pokemon.fromMap(e)).toList();

      if (pokemonName != null) {
        return dataFormated
            .where((element) => element.name == pokemonName)
            .toList();
      } else {
        return dataFormated;
      }
    } catch (error) {
      throw ApiExceptions(message: 'Não foi possível encontrar os dados');
    }
  }
}
