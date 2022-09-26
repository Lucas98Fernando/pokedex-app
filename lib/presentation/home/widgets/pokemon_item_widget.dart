import 'package:flutter/material.dart';
import 'package:pokedex/common/constraints/pokemon_color_constraints.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/presentation/details/container/details_container.dart';
import 'package:pokedex/presentation/home/widgets/pokemon_types_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  final Pokemon pokemon;
  final Function(String, DetailsProps) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
        '/details',
        DetailsProps(pokemon: pokemon),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: PokemonColorConstraints.color(type: pokemon.type[0])
                  ?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => PokemonTypesWidget(type: e))
                            .toList(),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 4,
            child: Image.network(
              pokemon.img,
            ),
          )
        ],
      ),
    );
  }
}
