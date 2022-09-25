import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/details/container/details_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.pokemonsList,
    required this.onItemTap,
  });
  final List<Pokemon> pokemonsList;
  final Function(String, DetailsProps) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pokemonsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(pokemonsList[index].name),
            onTap: () => onItemTap(
              '/details',
              DetailsProps(name: pokemonsList[index].name),
            ),
          );
        },
      ),
    );
  }
}
