import 'package:flutter/material.dart';
import 'package:pokedex/common/constraints/pokemon_color_constraints.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class DetailsCardWidget extends StatelessWidget {
  const DetailsCardWidget({
    super.key,
    required this.pokemon,
    required this.pokemonsList,
    required this.pokemonController,
    required this.onChangePokemon,
  });

  final Pokemon pokemon;
  final List<Pokemon> pokemonsList;
  final PageController pokemonController;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      height: 300,
      child: Container(
        color: PokemonColorConstraints.color(type: pokemon.type[0]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) => onChangePokemon(pokemonsList[index]),
                controller: pokemonController,
                children: pokemonsList
                    .map(
                      (e) => Opacity(
                        opacity: e != pokemon ? 0.4 : 1,
                        child: Image.network(e.img, fit: BoxFit.contain),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
