import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/common/constraints/pokemon_color_constraints.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/home/widgets/pokemon_types_widget.dart';

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
              child: Column(
                children: [
                  Row(
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
                  Row(
                    children: pokemon.type
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: PokemonTypesWidget(type: e),
                          ),
                        )
                        .toList(),
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
                children: pokemonsList.map((e) {
                  bool isDifferent = e.name != pokemon.name;
                  return Opacity(
                    opacity: isDifferent ? 0.4 : 1,
                    child: SvgPicture.network(
                      e.img,
                      fit: BoxFit.contain,
                      color: isDifferent ? Colors.black.withOpacity(0.4) : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
