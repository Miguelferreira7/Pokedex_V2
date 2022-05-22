import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit-model.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit.dart';

class PokemonCardView extends StatefulWidget {
  PokemonCardView({Key? key}) : super(key: key);

  static String ROUTE = "/pokemon-card";

  @override
  State<StatefulWidget> createState() => _PokemonCardViewState();
}

class _PokemonCardViewState extends State<PokemonCardView> {
  PokemonCubit? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = ModalRoute.of(context)?.settings.arguments as PokemonCubit;

    return BlocProvider.value(
      value: _bloc!,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: _appBar(),
        ),
        body: _bodyCardPokemon(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text(
        '${_bloc!.pokemonSelecionado.name}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      titleSpacing: 20,
      backgroundColor: _bloc!.pokemonSelecionado.baseColor,
      elevation: 0,
      actions: [
        Container(
          padding: EdgeInsets.fromLTRB(6, 20, 20, 6),
          child: Text('#${_bloc!.pokemonSelecionado.num}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _bodyCardPokemon() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 25, 10, 20),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _PokemonTypes(),
                  _informacoesEspeciais(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pesoPokemon(_bloc!.pokemonSelecionado.weight),
                      _alturaPokemon(_bloc!.pokemonSelecionado.height),
                    ],
                  )
                ],
              ),
            ),
            _backgroundPokeball(context, _bloc!.pokemonSelecionado.baseColor),
            _retonarIconFavorito(context, _bloc!.pokemonSelecionado.isFavorite),
            _pokemonImage(context, _bloc!.pokemonSelecionado.img),
          ],
        ),
      ),
    );
  }

  Widget _retonarIconFavorito(BuildContext context, bool? pokeFavorite) {
    return BlocBuilder<PokemonCubit, PokemonCubitModel>(
        builder: (context, state) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.27,
        right: MediaQuery.of(context).size.width / 18,
        child: GestureDetector(
            child: Icon(Icons.favorite,
                color: _bloc!.pokemonSelecionado.isFavorite == true
                    ? Colors.red
                    : Colors.grey,
                size: 30),
            onTap: () {

              if (_bloc!.pokemonSelecionado.isFavorite == false){
              _bloc?.adicionarFavorito();}
              else{
                _bloc?.removerFavorito();
              }
            }),
      );
    });
  }

  Widget _PokemonTypes() {
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        color: _bloc!.pokemonSelecionado.baseColor,
        border: Border.all(color: Colors.transparent, width: 2.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child:
      Text("${_bloc!.pokemonSelecionado.type?.first}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  Widget _informacoesEspeciais() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 12),
        child: Text(
          "Informações Especiais",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _bloc!.pokemonSelecionado.baseColor,
          ),
        ));
  }

  Widget _backgroundPokeball(context, Color? primaryColor) {
    return Container(
      margin: EdgeInsets.all(0),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Image.asset(
          'assets/Pokeball.png',
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          alignment: Alignment.topRight,
        ),
      ),
    );
  }

  Widget _alturaPokemon(String? pokeHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(50, 0, 5, 5),
          child: Text('${pokeHeight}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(50, 0, 5, 5),
          child: Text('Altura',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
        )
      ],
    );
  }

  Widget _pesoPokemon(String? pokeWeight) {
    return Column(
      children: [
        Container(
          child: Text('${pokeWeight}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
        ),
        Container(
          child: Text('Peso',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
          padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
        )
      ],
    );
  }

  Widget _pokemonImage(context, String? pokeimage) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.02,
      right: MediaQuery.of(context).size.width / 3.66,
      child: Image.network(
        '${pokeimage}',
        height: MediaQuery.of(context).size.height * 0.42,
        width: MediaQuery.of(context).size.width * 0.48,
        scale: 0.48,
      ),
    );
  }



}


// Widget _PokemonTypes() {
//   return ListView.builder(
//       itemCount: _bloc!.pokemonSelecionado.type?.length,
//       scrollDirection: Axis.horizontal,
//
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//             alignment: Alignment.center,
//             width: 80,
//             height: 30,
//             decoration: BoxDecoration(
//               color: _bloc!.pokemonSelecionado.baseColor,
//               border: Border.all(color: Colors.transparent, width: 2.5),
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//             ),
//             child: Text("${_bloc!.pokemonSelecionado.type![index]}",
//                 style: TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold)));
//       });
// }