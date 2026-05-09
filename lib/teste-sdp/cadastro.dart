	//DEPENDENCIAS
	/*dependencies:
	  sqflite: ^2.3.0
	  path: ^1.9.0*/
	  
class Cadastro {
  final int? id;
  final String nome;
  final DateTime data;

  Cadastro({this.id, required this.nome, required this.data});

  // Converte o objeto em um Map para o SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'data': data.toIso8601String(), // SQLite não tem tipo Date, salvamos como String
    };
  }
}