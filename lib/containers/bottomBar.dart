import 'package:flutter/material.dart';
import 'configurações/tela_configurações.dart';
import 'lista-pokemons/components/explorar-pokemons.dart';
import 'lista-pokemons/components/minha-pokedex.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  static String ROUTE = "/bottom-bar";


  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static final List<Widget> _pages = <Widget>[
    MinhaPokedex(),
    ListaTodosPokemonsPage(),
    Configuracoes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Sua Pokedex',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control_outlined),
            label: 'Pokemons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
