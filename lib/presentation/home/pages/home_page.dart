import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/details/container/details_container.dart';
import 'package:pokedex/presentation/home/widgets/pokemon_item_widget.dart';

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
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          children: pokemonsList
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemTap,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
