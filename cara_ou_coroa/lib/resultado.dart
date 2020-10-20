import "package:flutter/material.dart";

class Resultado extends StatefulWidget {
  var moedaGerada;

  Resultado(this.moedaGerada);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF61bd86),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("images/moeda_${widget.moedaGerada}.png"),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("images/botao_voltar.png"))
          ],
        ),
      ),
    );
  }
}
