import 'package:flutter/cupertino.dart';
import 'package:pokedex/common/exceptions/api_exceptions.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/repository/pokemon_respository.dart';
import 'package:pokedex/presentation/home/pages/home_error.dart';
import 'package:pokedex/presentation/home/pages/home_loading.dart';
import 'package:pokedex/presentation/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.respository});
  final IPokemonRepository respository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: respository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(pokemonsList: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(error: (snapshot.error as ApiExceptions).message!);
        }

        return Container();
      },
    );
  }
}
