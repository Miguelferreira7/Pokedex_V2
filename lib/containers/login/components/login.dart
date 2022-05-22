import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_v2/containers/bottomBar.dart';
import 'package:pokedex_v2/containers/home-page/home-page.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/explorar-pokemons.dart';
import 'package:pokedex_v2/containers/lista-pokemons/components/minha-pokedex.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  static String ROUTE = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKeyUser = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _titulo(),
                Padding(padding: EdgeInsets.all(8.0)),
                _email(),
                Padding(padding: EdgeInsets.all(8.0)),
                _senha(),
                Padding(padding: EdgeInsets.fromLTRB(8, 6, 8, 8)),
                _registrar(),
                _botaoEntrar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _botaoEntrar() {
    return Builder(
      builder: (context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
          onPressed: () {
            final String user = _userController.text;
            final String password = _passwordController.text;

            if (_formKeyUser.currentState!.validate() ||
                _formKeyPassword.currentState!.validate()) {
              Navigator.of(context).pushReplacementNamed(HomePage.ROUTE);
            }
          },
          child: Text("Entrar", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _titulo() {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/Pokeball.png',
            height: 110,
            width: 110,
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "BEM VINDO A SUA POKEDEX!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _email() {
    return Form(
      key: _formKeyUser,
      child: TextFieldContainer(
        child: TextFormField(
          controller: _userController,
          decoration: InputDecoration(
            icon: Icon(Icons.person, color: Colors.black54),
            labelText: "Insira aqui seu e-mail",
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6),
          ),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'O usuário é obrigatório';
            } else
              return null;
          },
        ),
      ),
    );
  }

  Widget _senha() {
    return Form(
      key: _formKeyPassword,
      child: TextFieldContainer(
        child: TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Colors.black54),
            labelText: "Insira aqui sua senha",
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'A senha é obrigatória';
            } else
              return null;
          },
        ),
      ),
    );
  }

  Widget _registrar() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 12,
      children: [
        Text(
          'Não possui uma conta?',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6),
        ),
        GestureDetector(
          child: Text(" Registre-se!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.redAccent)),
          onTap: () => Navigator.of(context).pushNamed("/register"),
        ),
      ],
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final child;

  TextFieldContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(9, 2, 2, 3),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: child,
    );
  }
}
