import 'package:flutter/material.dart';
import 'package:pokedex/common/constraints/pokemon_color_constraints.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/details/widgets/details_app_bar_widget.dart';
import 'package:pokedex/presentation/details/widgets/details_card_widget.dart';
import 'package:pokedex/presentation/details/widgets/info/title_info_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.pokemon,
    required this.pokemonsList,
    required this.onBack,
    required this.pokemonController,
    required this.onChangePokemon,
  });

  final Pokemon pokemon;
  final List<Pokemon> pokemonsList;
  final VoidCallback onBack;
  final PageController pokemonController;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 380,
            child: Stack(
              children: [
                DetailsAppBarWidget(
                  pokemon: pokemon,
                  onBack: onBack,
                ),
                DetailsCardWidget(
                  pokemon: pokemon,
                  pokemonsList: pokemonsList,
                  pokemonController: pokemonController,
                  onChangePokemon: onChangePokemon,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.info,
                              color: PokemonColorConstraints.color(
                                type: pokemon.type[0],
                              ),
                            ),
                          ),
                          Text(
                            'Infos',
                            style: TextStyle(
                              fontSize: 22,
                              color: PokemonColorConstraints.color(
                                type: pokemon.type[0],
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TitleInfoWidget(
                            text: 'Weight',
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.scale,
                                size: 20,
                                color: PokemonColorConstraints.color(
                                  type: pokemon.type[0],
                                ),
                              ),
                            ),
                            Text(pokemon.weight),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleInfoWidget(
                          text: 'Height',
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.height,
                                color: PokemonColorConstraints.color(
                                  type: pokemon.type[0],
                                ),
                              ),
                            ),
                            Text(pokemon.height),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
