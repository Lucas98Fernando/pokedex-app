import 'package:flutter/material.dart';

class PokemonTypesWidget extends StatelessWidget {
  const PokemonTypesWidget({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: Text(
          type,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
