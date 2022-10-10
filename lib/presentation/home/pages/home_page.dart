import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/common/store/pokemon_store.dart';
import 'package:pokedex/common/widgets/base_loading_widget.dart';
import 'package:pokedex/presentation/details/container/details_container.dart';
import 'package:pokedex/presentation/home/widgets/modal_bottom_sheet.dart';
import 'package:pokedex/presentation/home/widgets/pokemon_item_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.onItemTap,
  });

  final Function(String, DetailsProps) onItemTap;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pokemonStore = Provider.of<PokemonStore>(context);
    pokemonStore.fetchPokemons();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokédex',
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black.withOpacity(0.7),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (pokemonStore.allPokemons.isEmpty) {
            return const BaseLoading();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              children: pokemonStore.allPokemons
                  .map((e) => PokemonItemWidget(
                        pokemon: e,
                        onTap: widget.onItemTap,
                        index: pokemonStore.allPokemons.indexOf(e),
                      ))
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          builder: (BuildContext context) => const ModalBottomSheet(),
        ),
        backgroundColor: Colors.amber,
        elevation: 6,
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
