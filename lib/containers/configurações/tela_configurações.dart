import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {
  Configuracoes({Key? key}) : super(key: key);

  static String ROUTE = "/configuracoes";

  @override
  State<StatefulWidget> createState() => _configuracoes();
}

class _configuracoes extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Em produção...'),
      ),
    );
  }
}
