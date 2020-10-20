import "package:flutter/material.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController _cepController = TextEditingController();

  // String _resultado = '';

  // _recuperarCep() async {
  //   String cepDigitado = _cepController.text;
  //   String url = "https://viacep.com.br/ws/${cepDigitado}/json/";

  //   http.Response response;

  //   response = await http.get(url);

  //   Map<String, dynamic> objeto = json.decode(response.body);

  //   String cidade = objeto["localidade"];
  //   setState(() {
  //     _resultado = cidade;
  //   });

  //   print(cidade);

  // print(response.statusCode.toString());
  // print(response.body);
  String _preco = '0';

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";

    http.Response response = await http.get(url);

    Map<String, dynamic> objeto = json.decode(response.body);

    print(objeto['BRL']['buy']);

    setState(() {
      _preco = objeto['BRL']['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$ " + _preco,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              RaisedButton(
                color: Colors.amber[900],
                child: Text(
                  "Atualizar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _recuperarPreco,
              )
            ],
          ),
        ),
      ),
    );
  }
}
