import 'package:flutter/material.dart';
import 'package:pokedex_v2/containers/bottomBar.dart';
import 'package:pokedex_v2/containers/configura%C3%A7%C3%B5es/tela_configura%C3%A7%C3%B5es.dart';
import 'package:pokedex_v2/containers/home-page/home-page.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/card-detalhes-pokemon.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/minha-pokedex.dart';
import 'package:pokedex_v2/containers/login/components/login.dart';
import 'containers/lista-pokemons/components/explorar-pokemons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Pokédex V.2',
        theme: ThemeData(
          primaryColor: Colors.redAccent,
          primarySwatch: Colors.red,
          backgroundColor: Colors.white70
        ),
        initialRoute: Login.ROUTE,
        routes: {
          HomePage.ROUTE: (context) => HomePage(),
          ListaTodosPokemonsPage.ROUTE: (context) => ListaTodosPokemonsPage(),
          PokemonCardView.ROUTE: (context) => new PokemonCardView(),
          Login.ROUTE: (context) => new Login(),
          MinhaPokedex.ROUTE: (context) => new MinhaPokedex(),
          Configuracoes.ROUTE: (context) => new Configuracoes(),
        });
  }
}
