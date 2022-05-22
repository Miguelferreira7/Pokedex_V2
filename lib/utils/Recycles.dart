/*



List<Widget> children;
if (snapshot.hasData) {
children = <Widget>[
const Icon(
Icons.check_circle_outline,
color: Colors.green,
size: 60,
),
Padding(
padding: const EdgeInsets.only(top: 16),
child: Text('Result: ${snapshot.data}'),
)
];
} else if (snapshot.hasError) {
children = <Widget>[
const Icon(
Icons.error_outline,
color: Colors.red,
size: 60,
),
Padding(
padding: const EdgeInsets.only(top: 16),
child: Text('Error: ${snapshot.error}'),
)
];
}

EXPLORE PAGE:

FutureBuilder<List<Pokemon>>(
future: _apiGET(),
builder: (context, snapshot) {
List<Pokemon>? listaDePokemons = snapshot.data;
switch (snapshot.connectionState) {
case ConnectionState.none:
break;
case ConnectionState.waiting:
return LoadingPage();
case ConnectionState.active:
break;
case ConnectionState.done:
if (snapshot.hasData) {
return GridView.builder(
itemBuilder: (BuildContext context, int index) {
final int? _PokeId = listaDePokemons![index].id;
final String? _Pokeimage = listaDePokemons[index].img;
final String? _Pokename = listaDePokemons[index].name;
final String? _PokeNumber = listaDePokemons[index].num;
final String? _PokeHeight = listaDePokemons[index].height;
final String? _PokeWidth = listaDePokemons[index].weight;
final Color? _pokeColor =
listaDePokemons[index].baseColor;
final Color _colorborder = _pokeColor!;

return GestureDetector(
onTap: () => Navigator.push(
context,
MaterialPageRoute(
builder: (context) {
return PokemonCard(
pokeimage: _Pokeimage,
pokename: _Pokename,
pokeNumber: _PokeNumber,
primaryColor: _pokeColor,
pokeHeight: _PokeHeight,
pokeWidth: _PokeWidth,
);
},
),
),
child: Container(
decoration: BoxDecoration(
color: _pokeColor.withOpacity(0.8),
borderRadius: BorderRadius.circular(9),
),
child: Column(
mainAxisSize: MainAxisSize.max,
children: [
Container(
alignment: Alignment.topRight,
padding: EdgeInsets.fromLTRB(3, 2.5, 6, 0),
child: Text(
'#${_PokeNumber}',
style: TextStyle(
fontSize: 12,
fontWeight: FontWeight.bold),
),
),
Container(
width: MediaQuery.of(context).size.width,
height:
MediaQuery.of(context).size.height * 0.11,
alignment: Alignment.center,
child: Image.network('${_Pokeimage}')),
Container(
height:
MediaQuery.of(context).size.height * 0.043,
width: MediaQuery.of(context).size.width,
decoration: BoxDecoration(
color: _pokeColor.withOpacity(0.8),
borderRadius: BorderRadius.circular(9),
),
alignment: Alignment.center,
child: Text(
'${_Pokename}',
style: TextStyle(
color: Colors.white,
fontSize: 14,
fontWeight: FontWeight.w600),
),
),
],
),
),
);
},
itemCount: listaDePokemons?.length,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 10,
mainAxisSpacing: 15,
mainAxisExtent: 135),
padding: EdgeInsets.all(12));
}
break;
}
return Center(child: Text('Error'));
},
),



Future<List<Pokemon>> apiGET() async {
  List<Pokemon> pokemonsLista = [];
  String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  final response = await http.get(Uri.parse(url));
  if (response != null) {
    Map<String, dynamic>? map = json.decode(response.body);

    final List<dynamic> result = map?['pokemon'];
    final teste = PokemonList.fromJson(result).pokemons;
    pokemonsLista = teste!;
    print(PokemonList.fromJson(result).pokemons?[1].toString());
    return pokemonsLista;
  } else {
    return pokemonsLista;
  }
}

  // MaterialPageRoute(
              //   builder: (context) {
              //     return new PokemonCardView(
              //       id: listaPokemons[index].id,
              //       listaPokemon: listaPokemons,
              //       index: index
              //     );
              //   },
              // ),

 //GridView.builder(
        //     itemBuilder: (BuildContext context, int index) {
        //       final List<PokemonViewModel> listaPokemons = state.lista;
        //       return GestureDetector(
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(9),
        //           ),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.max,
        //             children: [
        //               Container(
        //                   width: MediaQuery.of(context).size.width,
        //                   height: MediaQuery.of(context).size.height * 0.11,
        //                   alignment: Alignment.center,
        //                   child: Image.network('${listaPokemons[index].img}')),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //     itemCount: Pokemons.length,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 10,
        //         mainAxisSpacing: 15,
        //         mainAxisExtent: 135),
        //     padding: EdgeInsets.fromLTRB(8, 0, 8, 8));

class ExplorePageState extends State<ExplorePage> {
  PokemonCubit? _bloc;

  final API api = API();

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
        create: (BuildContext context) {
          _bloc = PokemonCubit();
          return _bloc!;
        },
        child:  Scaffold(
          appBar:  PreferredSize(
              preferredSize: const Size.fromHeight(100), child: _appBar()),
          body: _body(),
        ));
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white60,
      toolbarHeight: 100,
      leadingWidth: 80,
      elevation: 0,
      leading: Container(
        height: 30,
        width: 150,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child:
            Image.asset('assets/Pokeball.png', scale: 28, color: Colors.black),
      ),
      title: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        width: 300,
        child: Text(
          "Pokémons",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MinhaPokedex.ROUTE, arguments: _bloc);
          },
          child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 42, 0),
              alignment: Alignment.centerRight,
              width: 15,
              child: Icon(Icons.favorite, color: Colors.red, size: 34)),
        ),
      ],
    );
  }

  Widget _body() {
    return new BlocBuilder<PokemonCubit, PokemonCubitModel>(
        builder: (context, state) {
      if (!state.buscouListaPokemons) {
        _bloc!.inicializarListaPokemons(api);
      }

      if (state.listaPokemons!.isNotEmpty) {
        return _GridViewPokemons(state.listaPokemons);
      }
      return LoadingPage();
    });
  }

  Widget _GridViewPokemons(List<PokemonViewModel>? listaPokemons) {
    return new GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          final Color? _pokeColor = listaPokemons![index].baseColor;
          final Color _colorborder = _pokeColor!;

          return  GestureDetector(
            onTap: () {
              _bloc!.pokemonSelecionado = listaPokemons[index];

              Navigator.of(context)
                  .pushNamed(PokemonCardView.ROUTE, arguments: _bloc);
            },
            child: new Container(
              decoration: BoxDecoration(
                color: _pokeColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(9),
              ),
              child: new Column(
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
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8));
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
 */