import 'package:flutter/material.dart';
import 'package:notas_diarias/helper/AnotacaoHelper.dart';
import 'model/anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = List<Anotacao>();

  Anotacao _ultimaAnotacaoRemovida = Anotacao("", "", "");

  _showRegisterScreen() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.all(c)
                  ),
                  child: TextField(
                    controller: _tituloController,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Título", hintText: "Digite o título..."),
                  ),
                ),
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                      labelText: "Descrição",
                      hintText: "Digite a descrição..."),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    _saveAnotacao();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")),
            ],
          );
        });
  }

  _getAnotacoes() async {
    List recoveredAnotacoes = await _db.getAnotacoes();
    List<Anotacao> listaTemp = List<Anotacao>();
    for (var item in recoveredAnotacoes) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemp.add(anotacao);
    }
    setState(() {
      _anotacoes = listaTemp;
    });
    listaTemp = null;

    // print(recoveredAnotacoes.toString());
  }

  _saveAnotacao() async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());

    await _db.saveAnotacao(anotacao);
    // print(resultado.toString());

    _tituloController.clear();
    _descricaoController.clear();

    _getAnotacoes();
  }

  _formatDate(String date) {
    initializeDateFormatting("pt_BR");
    var formater = DateFormat("d/M/y");
    DateTime convertedDate = DateTime.parse(date);
    String formatedDate = formater.format(convertedDate);

    return formatedDate;
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
    _getAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    // _getAnotacoes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas anotações',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontSize: 22)),
        centerTitle: true,
        // backgroundColor: Colors.grey[850],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF191714),
                Color(0xFF2234AE),
              ])),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _anotacoes.length,
                  itemBuilder: (context, index) {
                    final anotacao = _anotacoes[index];
                    print(index);
                    return Dismissible(
                        key: Key(anotacao.id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          _removerAnotacao(anotacao.id);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              anotacao.titulo,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${_formatDate(anotacao.data)} - ${anotacao.descricao}",
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print(_anotacoes[index].toString());
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.greenAccent[400],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }))
        ],
      ),
      backgroundColor: Colors.grey[350],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _showRegisterScreen();
        },
      ),
    );
  }
}
