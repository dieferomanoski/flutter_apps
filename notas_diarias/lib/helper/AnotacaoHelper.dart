import 'package:notas_diarias/model/anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {
  static final String nomeTabela = "anotacao";
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _db;

  factory AnotacaoHelper() {
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDatabase();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE $nomeTabela (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo VARCHAR, descricao TEXT, data DATETIME)";
    await db.execute(sql);
  }

  initDatabase() async {
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "database.db");

    var db = await openDatabase(localDatabase, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> saveAnotacao(Anotacao anotacao) async {
    var database = await db;

    int resultado = await database.insert(nomeTabela, anotacao.toMap());
    return resultado;
  }

  Future<int> removerAnotacao(int id) async {
    var database = await db;
    return await database.delete(
      nomeTabela,
      where: "id = ?",
      whereArgs: [id]
    );
  }

  getAnotacoes() async {
    var database = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC";
    List anotacoes = await database.rawQuery(sql);
    return anotacoes;
  }
}
