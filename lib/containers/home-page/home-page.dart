import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/api/pokemon-api/webclient.dart';
import 'package:pokedex_v2/containers/configura%C3%A7%C3%B5es/tela_configura%C3%A7%C3%B5es.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit-model.dart';
import 'package:pokedex_v2/containers/lista-pokemons/bloc/pokemons-cubit.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/explorar-pokemons.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/minha-pokedex.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static String ROUTE = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonCubit? _bloc;

  final API api = API();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        _bloc = PokemonCubit();

        if (!_bloc!.state.buscouListaPokemons) {
          _bloc!.inicializarListaPokemons(api);
        }

        _bloc!.inicializarListaFavoritos();
        return _bloc!;
      },
      child: BlocBuilder<PokemonCubit, PokemonCubitModel>(
        builder: (context, state) {
          return new Scaffold(
            backgroundColor: Color.fromRGBO(243, 243, 243, 1),
            appBar: new PreferredSize(
                preferredSize: const Size.fromHeight(160), child: _appBar()),
            body: _body(),
          );
        },
      ));
  }

  Widget _appBar() {
    return new AppBar(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      elevation: 0,
      toolbarHeight: 160,
      title: new Container(
          height: 160,
          alignment: Alignment.centerLeft,
          child: new Text(
            "Bem vindo a sua \nPokedex, #Usuário!",
            softWrap: true,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      actions: [
        Container(
          child: Image.asset(
            "assets/Pokeballv2.png",
            scale: 0.5,
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }

  Widget _body() {
    return new Container(
        padding: const EdgeInsets.only(top: 36, right: 16, left: 16),
        alignment: Alignment.topCenter,
        child: _retornaOpcoesMenu());
  }

  Widget _retornaOpcoesMenu() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        new Container(
          width: MediaQuery.of(context).size.width / 1.15,
          height: MediaQuery.of(context).size.height / 12,
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          child: new ElevatedButton(
            child: new Text(
              "Acesse sua Pokédex",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: new ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(249, 81, 81, 20)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(11))),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MinhaPokedex.ROUTE, arguments: _bloc);
            },
          ),
        ),
        new Container(
          width: MediaQuery.of(context).size.width / 1.15,
          height: MediaQuery.of(context).size.height / 12,
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          child: new ElevatedButton(
            child: Text(
              "Todos Os Pokémons",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: new ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(246, 206, 101, 20)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(11))),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ListaTodosPokemonsPage.ROUTE, arguments: _bloc);
            },
          ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 12,
              padding: const EdgeInsets.only(bottom: 8, top: 8, left: 8),
              child: new ElevatedButton(
                child: new Text(
                  "Botão",
                  style:
                      new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: new ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(101, 133, 246, 20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                onPressed: () {},
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 12,
              padding: const EdgeInsets.only(bottom: 8, top: 8, right: 8),
              child: new ElevatedButton(
                child: new Text(
                  "Botão",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: new ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(104, 204, 138, 20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        new Container(
          width: MediaQuery.of(context).size.width / 1.15,
          height: MediaQuery.of(context).size.height / 12,
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          child: new ElevatedButton(
            child: Text(
              "Configurações",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: new ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white38),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(11))),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(Configuracoes.ROUTE);
            },
          ),
        ),
      ],
    );
  }
}
