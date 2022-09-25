import 'package:flutter/cupertino.dart';
import 'package:pokedex/common/exceptions/api_exceptions.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/repository/pokemon_respository.dart';
import 'package:pokedex/common/widgets/base_error_widget.dart';
import 'package:pokedex/common/widgets/base_loading_widget.dart';
import 'package:pokedex/presentation/details/pages/details_page.dart';

class DetailsProps {
  DetailsProps({required this.name});
  final String name;
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.respository,
    required this.props,
  });
  final IPokemonRepository respository;
  final DetailsProps props;

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
          return DetailsPage(
            name: props.name,
            pokemonsList: snapshot.data!,
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
