import 'package:flutter/material.dart';
import 'package:pokedex/common/exceptions/api_exceptions.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/store/pokemon_store.dart';
import 'package:pokedex/common/widgets/base_error_widget.dart';
import 'package:pokedex/common/widgets/base_loading_widget.dart';
import 'package:pokedex/presentation/details/pages/details_page.dart';

class DetailsProps {
  DetailsProps({
    required this.pokemon,
    this.index = 0,
    this.id = 0,
  });

  final Pokemon pokemon;
  final int? index;
  final int? id;
}

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({
    super.key,
    required this.props,
    required this.onBack,
  });

  final DetailsProps props;
  final VoidCallback onBack;

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  late PageController _pokemonController;
  late Future<List<Pokemon>>? _futurePokemons;
  Pokemon? _pokemon;
  late PokemonStore pokemonStore = PokemonStore();

  @override
  void initState() {
    super.initState();

    _futurePokemons = pokemonStore.fetchPokemons();
    _pokemonController = PageController(
      viewportFraction: 0.6,
      initialPage: widget.props.id! - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _futurePokemons,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const BaseLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _pokemon ??= widget.props.pokemon;

          return DetailsPage(
            pokemon: _pokemon!,
            pokemonsList: snapshot.data!,
            pokemonController: _pokemonController,
            onBack: widget.onBack,
            onChangePokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
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
