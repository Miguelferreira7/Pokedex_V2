import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit-model.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/card-detalhes-pokemon.dart';
import 'package:pokedex_v2/containers/lista-pokemons/models/pokemon-viewmodel.dart';

class MinhaPokedex extends StatefulWidget {
  const MinhaPokedex({Key? key}) : super(key: key);

  static String ROUTE = "/minha-pokedex";

  @override
  State<MinhaPokedex> createState() => MinhaPokedexState();
}

class MinhaPokedexState extends State<MinhaPokedex> {
  PokemonCubit? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = ModalRoute.of(context)!.settings.arguments as PokemonCubit;

    return BlocProvider.value(
      value: _bloc!,
      child: BlocBuilder<PokemonCubit, PokemonCubitModel>(
          builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: _appBar(),
          ),
          body: _body(),
        );
      }),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white60,
      toolbarHeight: 100,
      leadingWidth: 80,
      elevation: 0,
      leading: Container(
        child: GestureDetector(
          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            padding: EdgeInsets.only(right: 8),
            child: Image.asset('assets/Pokeball.png',
                scale: 28, color: Colors.black),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              "Minha Pokédex",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 32, 0),
          alignment: Alignment.centerRight,
          width: 15,
          child: GestureDetector(
              onTap: () {
              },
              child: Icon(Icons.swap_vert_outlined,
                  color: Colors.black, size: 28)),
        )
      ],
    );
  }

  Widget _body() {
    return BlocBuilder<PokemonCubit, PokemonCubitModel>(
        builder: (context, state) {

          if(state.listaPokemonsFavoritos!.isNotEmpty){
            return _GridViewPokemons(state.listaPokemonsFavoritos);
          }else{
            return Center(
              child: Text("Tu não tem pokemon na sua pokédex"),
            );
          }

    });
  }

  Widget _GridViewPokemons(List<PokemonViewModel>? listaPokemons) {
    return new GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          final Color? _pokeColor = listaPokemons![index].baseColor;
          final Color _colorborder = _pokeColor!;

          return GestureDetector(
            onTap: () {
              _bloc!.pokemonSelecionado = listaPokemons[index];

              Navigator.of(context)
                  .pushNamed(PokemonCardView.ROUTE, arguments: _bloc);
            },
            child: Container(
              decoration: BoxDecoration(
                color: _pokeColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _numeroPokemon(context, listaPokemons[index].num),
                  _pokemonImagem(context, listaPokemons[index].img),
                  _pokemonNome(context, listaPokemons[index].name, _pokeColor)
                ],
              ),
            ),
          );
        },
        itemCount: listaPokemons!.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            mainAxisExtent: 160),
        padding: EdgeInsets.fromLTRB(8, 10, 8, 8));
  }

  Widget _numeroPokemon(context, String? numPokemon) {
    return new Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.fromLTRB(3, 9, 9, 0),
      child: new Text(
        '#${numPokemon}',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white70),
      ),
    );
  }

  Widget _pokemonImagem(context, String? imagemPokemon) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        alignment: Alignment.center,
        child: Image.network('${imagemPokemon}'));
  }

  Widget _pokemonNome(context, String? nomePokemon, corPokemon) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.030,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: corPokemon.withOpacity(0.8),
        borderRadius: BorderRadius.circular(9),
      ),
      alignment: Alignment.center,
      child: Text(
        '${nomePokemon}',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}
