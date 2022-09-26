import 'package:flutter/material.dart';
import 'package:pokedex/common/exceptions/api_exceptions.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/repository/pokemon_respository.dart';
import 'package:pokedex/common/widgets/base_error_widget.dart';
import 'package:pokedex/common/widgets/base_loading_widget.dart';
import 'package:pokedex/presentation/details/container/details_container.dart';
import 'package:pokedex/presentation/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.respository,
    required this.onItemTap,
  });
  final IPokemonRepository respository;
  final Function(String, DetailsProps) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: respository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const BaseLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            pokemonsList: snapshot.data!,
            onItemTap: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return BaseError(error: (snapshot.error as ApiExceptions).message!);
        }

        return Container();
      },
    );
  }
}
