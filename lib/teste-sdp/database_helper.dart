import 'package:ddm_crud_sqlite/model/tarefa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'meu_banco.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cadastros(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, data TEXT)',
        );
      },
      version: 1,
    );
  }

  /*static Future<void> insertCadastro(Cadastro cadastro) async {
    final db = await initDb();
    await db.insert('cadastros', cadastro.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }*/

  static Future<void> insertTarefa(Tarefa cadastro) async {
    final db = await initDb();
    await db.insert('cadastros', cadastro.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}