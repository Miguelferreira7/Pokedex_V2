import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/api/pokemon-api/webclient.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit-actions.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit-model.dart';
import 'package:pokedex_v2/containers/lista-pokemons/models/pokemon-viewmodel.dart';

class PokemonCubit extends Cubit<PokemonCubitModel>
    implements PokemonCubitActions {
  PokemonCubit()
      : super(PokemonCubitModel(
            listaPokemons: [],
            listaPokemonsFavoritos: [],
            buscouListaPokemons: false,
            buscouListaPokemonsFavoritos: false));

  PokemonViewModel pokemonSelecionado = PokemonViewModel();
  bool isFavorite = false;

  @override
  void inicializarListaPokemons(API api) async {
    api.apiGET().then(
          (pokemons) => emit(
            state.patchState(
                buscouListaPokemons: true, listaPokemons: pokemons),
          ),
        );
  }

  @override
  void adicionarFavorito() async {
    pokemonSelecionado.isFavorite = true;
    state.listaPokemonsFavoritos?.add(pokemonSelecionado);
    inicializarListaFavoritos();
    emit(
        state.patchState(listaPokemonsFavoritos: state.listaPokemonsFavoritos));
  }

  @override
  void inicializarListaFavoritos() async {
    emit(state.patchState(
        buscouListaPokemonsFavoritos: true,
        listaPokemonsFavoritos: state.listaPokemonsFavoritos));
  }

  @override
  void removerFavorito() {
    pokemonSelecionado.isFavorite = false;
    state.listaPokemonsFavoritos?.remove(pokemonSelecionado);
    emit(
        state.patchState(listaPokemonsFavoritos: state.listaPokemonsFavoritos));
  }

  @override
  void tratarFavorito(List<PokemonViewModel> lista) {}

  @override
  void loading() {}
}
