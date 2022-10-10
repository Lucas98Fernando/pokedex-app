import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/repository/pokemon_repository.dart';

part 'pokemon_store.g.dart';

class PokemonStore = PokemonStoreBase with _$PokemonStore;

abstract class PokemonStoreBase with Store {
  @observable
  List<Pokemon> allPokemons = [];

  @action
  Future<List<Pokemon>> fetchPokemons({String? pokemonName}) async {
    final response =
        await PokemonRepository(dio: Dio()).getAllPokemons(pokemonName);

    setPokemons(response);
    return response;
  }

  @action
  void setPokemons(value) => allPokemons = value;
}
