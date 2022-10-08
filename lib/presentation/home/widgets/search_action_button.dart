import 'package:flutter/material.dart';
import 'package:pokedex/presentation/home/widgets/modal_bottom_sheet.dart';

class SearchActionButton extends StatelessWidget {
  const SearchActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalSearch(context),
      backgroundColor: Colors.amber,
      elevation: 6,
      child: const Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }
}
