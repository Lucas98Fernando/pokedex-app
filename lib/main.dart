import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/repository/pokemon_respository.dart';
import 'package:pokedex/presentation/home/container/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        respository: PokemonRespository(
          dio: Dio(),
        ),
      ),
    );
  }
}
