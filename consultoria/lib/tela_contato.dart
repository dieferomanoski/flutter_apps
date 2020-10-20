import 'package:flutter/material.dart';


class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contato"),
          backgroundColor: Colors.green[400],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("images/detalhe_contato.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Contato",
                        style: TextStyle(fontSize: 20, color: Colors.green[600]),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("atendimento@atmconsultoria.com.br",
                  style: TextStyle(fontSize: 18),),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Telefone: (11) 3525-8596",
                  style: TextStyle(fontSize: 18),),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Celular: (11) 99586-5236",
                  style: TextStyle(fontSize: 18),),
                  )
              ],
            ),
          ),
        ));
  }
}