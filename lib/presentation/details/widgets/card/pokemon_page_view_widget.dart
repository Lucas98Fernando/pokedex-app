import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class PokemonPageViewWidget extends StatelessWidget {
  const PokemonPageViewWidget({
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
      top: 200,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: PageView(
          onPageChanged: (index) => onChangePokemon(pokemonsList[index]),
          controller: pokemonController,
          children: pokemonsList.map(
            (e) {
              bool isDifferent = e.name != pokemon.name;
              return Opacity(
                opacity: isDifferent ? 0.4 : 1,
                child: SvgPicture.network(
                  e.img,
                  fit: BoxFit.contain,
                  color: isDifferent ? Colors.black.withOpacity(0.4) : null,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
