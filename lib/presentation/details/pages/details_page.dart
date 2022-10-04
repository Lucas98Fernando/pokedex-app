import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/details/widgets/details_app_bar_widget.dart';
import 'package:pokedex/presentation/details/widgets/card/details_header_widget.dart';
import 'package:pokedex/presentation/details/widgets/info/pokemon_info_widget.dart';
import 'package:pokedex/presentation/details/widgets/card/pokemon_page_view_widget.dart';

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
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                DetailsAppBarWidget(
                  pokemon: pokemon,
                  onBack: onBack,
                ),
                DetailsHeaderWidget(
                  pokemon: pokemon,
                ),
                PokemonInfoWidget(
                  pokemon: pokemon,
                ),
                PokemonPageViewWidget(
                  pokemon: pokemon,
                  pokemonsList: pokemonsList,
                  pokemonController: pokemonController,
                  onChangePokemon: onChangePokemon,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
