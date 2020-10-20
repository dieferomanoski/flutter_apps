import 'package:consultoria/tela_cliente.dart';
import 'package:consultoria/tela_contato.dart';
import 'package:consultoria/tela_empresa.dart';
import 'package:consultoria/tela_servico.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void _abrirEmpresa() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> TelaEmpresa()));
  }
  void _abrirServico() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> TelaServico()));
  }
  void _abrirContato() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> TelaContato()));
  }
  void _abrirCliente() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> TelaCliente()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ATM Consultoria"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _abrirEmpresa,
                      child: Image.asset("images/menu_empresa.png"),
                    ),
                    GestureDetector(
                      onTap: _abrirServico,
                      child: Image.asset("images/menu_servico.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _abrirCliente,
                      child: Image.asset("images/menu_cliente.png"),
                    ),
                    GestureDetector(
                      onTap: _abrirContato,
                      child: Image.asset("images/menu_contato.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
