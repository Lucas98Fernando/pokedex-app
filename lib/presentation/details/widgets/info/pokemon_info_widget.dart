import 'package:flutter/material.dart';
import 'package:pokedex/common/constraints/pokemon_color_constraints.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/details/widgets/info/title_info_widget.dart';

class PokemonInfoWidget extends StatelessWidget {
  const PokemonInfoWidget({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
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
    );
  }
}
