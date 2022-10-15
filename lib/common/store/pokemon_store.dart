import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/repository/pokemon_repository.dart';

part 'pokemon_store.g.dart';

class PokemonStore = PokemonStoreBase with _$PokemonStore;

abstract class PokemonStoreBase with Store {
  @observable
  List<Pokemon> allPokemons = [];

  @observable
  List<Pokemon> pokemonsFiltered = [];

  @observable
  String pokemonNameFilter = '';

  @observable
  bool isLoading = false;

  @action
  Future<List<Pokemon>> fetchPokemons() async {
    setLoading(true);
    if (allPokemons.isEmpty) {
      final response = await PokemonRepository(dio: Dio()).getAllPokemons();
      setPokemons(response);
      setPokemonsFiltered(response);
      setLoading(false);
      return response;
    } else {
      setLoading(false);
      setPokemonsFiltered(allPokemons);
      return allPokemons;
    }
  }

  @action
  List<Pokemon> getPokemonFiltered({required String pokemonName}) {
    final pokemonsFiltered =
        allPokemons.where((element) => element.name == pokemonName).toList();

    setPokemonsFiltered(pokemonsFiltered);
    return pokemonsFiltered;
  }

  @action
  void setPokemons(value) => allPokemons = value;

  @action
  void setPokemonsFiltered(value) => pokemonsFiltered = value;

  @action
  setPokemonNameFilter(String value) => pokemonNameFilter = value;

  @action
  setLoading(bool value) => isLoading = value;
}
