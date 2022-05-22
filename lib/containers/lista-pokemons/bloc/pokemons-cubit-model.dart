import 'package:pokedex_v2/containers/lista-pokemons/models/pokemon-viewmodel.dart';

class PokemonCubitModel {
  List<PokemonViewModel>? listaPokemons;
  List<PokemonViewModel>? listaPokemonsFavoritos;
  bool buscouListaPokemons;
  bool buscouListaPokemonsFavoritos;

  PokemonCubitModel({
    this.listaPokemons,
    this.listaPokemonsFavoritos,
    this.buscouListaPokemons = false,
    this.buscouListaPokemonsFavoritos = false,
  });

  PokemonCubitModel patchState({
    List<PokemonViewModel>? listaPokemons,
    List<PokemonViewModel>? listaPokemonsFavoritos,
    bool? buscouListaPokemons,
    bool? buscouListaPokemonsFavoritos,
  }) {
    return PokemonCubitModel(
      listaPokemons: listaPokemons ?? this.listaPokemons,
      listaPokemonsFavoritos:
      listaPokemonsFavoritos ?? this.listaPokemonsFavoritos,
      buscouListaPokemons: buscouListaPokemons ?? this.buscouListaPokemons,
      buscouListaPokemonsFavoritos:
      buscouListaPokemonsFavoritos ?? this.buscouListaPokemonsFavoritos,
    );
  }
}

