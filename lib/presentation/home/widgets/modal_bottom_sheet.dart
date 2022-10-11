import 'package:flutter/material.dart';
import 'package:pokedex/common/store/pokemon_store.dart';
import 'package:provider/provider.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  TextEditingController pokemonNameController = TextEditingController();

  @override
  void dispose() {
    pokemonNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonStore = Provider.of<PokemonStore>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Search Pokémon',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                Form(
                  child: TextField(
                    controller: pokemonNameController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(
                        Icons.pets,
                      ),
                    ),
                    onChanged: (value) =>
                        pokemonStore.setPokemonNameFilter(value),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {
                      pokemonStore.fetchPokemons(
                        pokemonName: pokemonStore.pokemonFilter,
                      ),
                      Navigator.pop(context),
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Search'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () => {
                    pokemonStore.fetchPokemons(),
                    Navigator.pop(context),
                  },
                  child: const Center(
                    child: Text(
                      'Clean Filters',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
