import 'package:pokedex_v2/api/pokemon-api/webclient.dart';
import 'package:pokedex_v2/containers/lista-pokemons/models/pokemon-viewmodel.dart';

abstract class PokemonCubitActions {
  void inicializarListaPokemons (API api);
  void inicializarListaFavoritos();

  void tratarFavorito(List<PokemonViewModel> lista);
  void adicionarFavorito();
  void removerFavorito();
  void loading();

}
