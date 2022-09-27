import 'package:flutter/material.dart';
import 'package:pokedex/common/repository/pokemon_respository.dart';
import 'package:pokedex/presentation/details/container/details_container.dart';
import 'package:pokedex/presentation/home/container/home_container.dart';

class Routes extends StatelessWidget {
  const Routes({
    super.key,
    required this.repository,
  });

  final PokemonRespository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) {
                return HomeContainer(
                  respository: repository,
                  onItemTap: (route, props) {
                    Navigator.of(context).pushNamed(route, arguments: props);
                  },
                );
              },
            );
          case '/details':
            return MaterialPageRoute(
              builder: (context) {
                return DetailsContainer(
                  respository: repository,
                  props: (settings.arguments as DetailsProps),
                  onBack: () => Navigator.of(context).pop(),
                );
              },
            );
        }
        return null;
      },
    );
  }
}
