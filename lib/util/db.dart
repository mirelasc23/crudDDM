import 'package:ddm_crud_sqlite/model/model.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;

class DBUtil {
  static Future<sqlite.Database> _getDB() async {
    //local onde o banco de dados sera armazenado
    final databasePath = await sqlite.getDatabasesPath();
    //join para criar o caminho p arq de forma correta, independente do SO
    final arqBD = path.join(databasePath, "tarefas.db");

    //abrir o banco de dados, se nao existir, ele cria
    //funcao onCreate so eh chamada na primeira vez
    return sqlite.openDatabase(
      arqBD,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
          CREATE TABLE Tarefa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            descricao TEXT,
            data_prevista TEXT,
            importante INTEGER NOT NULL,
            realizada INTEGER NOT NULL,
            custo INTEGER
          )
        ''',
        ); //custo como INTERGER pq salva em centavos, para evitar problemas de arredondamento com FLOAT ou REAL
      },
    );
  }

  static Future<void> insert(Model model) async {
    final db = await _getDB();
    model.id = await db.insert(model.runtimeType.toString(), model.toMap());
  }

  static Future<List<Map<String, dynamic>>> list(String table) async {
    final db = await _getDB();
    return db.query(table);
  }

  static Future<int> delete(String table, int id) async {
    final db = await _getDB();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
