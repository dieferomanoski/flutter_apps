import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controllerAlc = TextEditingController();
  TextEditingController controllerGas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
         padding: EdgeInsets.all(32),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Saiba qual a melhor opção para o abastecimento do seu carro",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),

            
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Álcool, ex: 1.59",
                  labelStyle: TextStyle(
                    fontSize: 19,
                    color: Colors.black
                  )
                ),
              
                controller: controllerAlc,
              ),
           
           
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, ex: 3.59",
                  labelStyle: TextStyle(
                    fontSize: 19,
                    color: Colors.black
                  )
                  ),
              
                controller: controllerGas,
                
              ),
          

            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.blue,
                padding: EdgeInsets.all(15),

                child: Text("Calcular",
                
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
                
                onPressed: (){},
            )
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Resultado",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
              )
           
          ],
        ),
        ),
      ),
    );
  }
}
