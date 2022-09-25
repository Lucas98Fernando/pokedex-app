import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.pokemonsList});
  final List<Pokemon> pokemonsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pokemonsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(pokemonsList[index].name),
          );
        },
      ),
    );
  }
}
