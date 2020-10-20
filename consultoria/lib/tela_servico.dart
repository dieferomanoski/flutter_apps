import 'package:flutter/material.dart';


class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Serviços"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("images/detalhe_servico.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Nossos serviços",
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Consultoria",
                  style: TextStyle(fontSize: 18),),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Cálculo de preços",
                  style: TextStyle(fontSize: 18),),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Acompanhamento de projetos",
                  style: TextStyle(fontSize: 18),),
                  )
              ],
            ),
          ),
        ));
  }
}