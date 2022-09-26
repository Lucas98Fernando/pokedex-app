import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.pokemon,
    required this.pokemonsList,
  });
  final Pokemon pokemon;
  final List<Pokemon> pokemonsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: pokemonsList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
