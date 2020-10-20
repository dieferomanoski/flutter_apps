import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Empresa"),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("images/detalhe_empresa.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Sobre a empresa",
                        style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ornare ante vitae nibh maximus porta. Morbi eleifend laoreet varius. Pellentesque luctus nunc in semper tincidunt. Nullam eu sem egestas, commodo leo at, egestas urna. Nunc pretium non massa ac faucibus. Suspendisse pharetra metus eu diam congue molestie. Donec porttitor arcu a est faucibus, ut accumsan ante imperdiet. Morbi molestie laoreet quam, sit amet mattis enim varius id. Donec magna metus, egestas ut metus non, congue dictum neque. Nunc tempor est laoreet aliquam condimentum. Curabitur suscipit enim massa, eu convallis lacus imperdiet ac. Aenean sed maximus dolor."+
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ornare ante vitae nibh maximus porta. Morbi eleifend laoreet varius. Pellentesque luctus nunc in semper tincidunt. Nullam eu sem egestas, commodo leo at, egestas urna. Nunc pretium non massa ac faucibus. Suspendisse pharetra metus eu diam congue molestie. Donec porttitor arcu a est faucibus, ut accumsan ante imperdiet. Morbi molestie laoreet quam, sit amet mattis enim varius id. Donec magna metus, egestas ut metus non, congue dictum neque. Nunc tempor est laoreet aliquam condimentum. Curabitur suscipit enim massa, eu convallis lacus imperdiet ac. Aenean sed maximus dolor."+
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ornare ante vitae nibh maximus porta. Morbi eleifend laoreet varius. Pellentesque luctus nunc in semper tincidunt. Nullam eu sem egestas, commodo leo at, egestas urna. Nunc pretium non massa ac faucibus. Suspendisse pharetra metus eu diam congue molestie. Donec porttitor arcu a est faucibus, ut accumsan ante imperdiet. Morbi molestie laoreet quam, sit amet mattis enim varius id. Donec magna metus, egestas ut metus non, congue dictum neque. Nunc tempor est laoreet aliquam condimentum. Curabitur suscipit enim massa, eu convallis lacus imperdiet ac. Aenean sed maximus dolor.",
                            style: TextStyle(fontSize: 16),)

                  )
              ],
            ),
          ),
        ));
  }
}
