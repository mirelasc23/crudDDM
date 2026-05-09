import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<int> inserirItem(Map<String, dynamic> row) async {
  // 1. Obter a referência do banco de dados (assumindo que você já tem a lógica de abertura)
  Database db = await openDatabase(
    join(await getDatabasesPath(), 'meu_banco.db'),
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE itens(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT)",
      );
    },
  );

  // 2. Inserir o dado e capturar o ID retornado
  int id = await db.insert(
    'itens', // Nome da tabela
    row,     // Mapa com os dados (ex: {'nome': 'Exemplo'})
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print("ID inserido: $id");
  return id; // Retorna o ID gerado automaticamente
}
