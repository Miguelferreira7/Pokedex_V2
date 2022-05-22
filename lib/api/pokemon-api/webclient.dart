import 'package:http/http.dart' as http;
import 'package:pokedex_v2/api/consts.dart';
import 'dart:convert';

import 'package:pokedex_v2/containers/lista-pokemons/models/pokemon-viewmodel.dart';

class API{
  Future<List<PokemonViewModel>> apiGET() async {

    List<PokemonViewModel> pokemonsLista = [];
    String url = Consts().urlApiPokemon;

    final response = await http.get(Uri.parse(url));

      Map<String, dynamic>? map = json.decode(response.body);

      final List<dynamic> result = map?['pokemon'];
      final teste = PokemonList.fromJson(result).pokemons;
      pokemonsLista = teste!;
      print(PokemonList.fromJson(result).pokemons?[1].toString());
      return pokemonsLista;

  }
}


