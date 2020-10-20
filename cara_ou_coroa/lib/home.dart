import 'dart:math';

import 'package:flutter/material.dart';
import 'resultado.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _exibirResultado() {
    var itens = ["cara", "coroa"];
    var numeroAleatorio = Random().nextInt(2);
    var resultado = itens[numeroAleatorio];

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultado(
                 resultado
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF61bd86),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("images/logo.png"),
            GestureDetector(
                onTap: _exibirResultado,
                child: Image.asset("images/botao_jogar.png"))
          ],
        ),
      ),
    );
  }
}
