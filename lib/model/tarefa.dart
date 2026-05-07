import 'package:ddm_crud_sqlite/model/model.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';

class Tarefa implements Model {
  int? _id;
  String titulo;
  String? descricao;
  DateTime dataPrevista;
  bool importante;
  bool _realizado;
  double? custo;

  Tarefa({
    required this.titulo,
    this.descricao,
    required this.importante,
    required this.dataPrevista,
    this.custo,
  }) : _realizado = false;

  Tarefa.completa({
    int? id,
    required this.titulo,
    this.descricao,
    required this.importante,
    required this.dataPrevista,
    bool realizadoBD = false,
    this.custo,
  }) : _id = id,
       _realizado = realizadoBD;

  void estaRealizado(bool realizado) {
    _realizado = realizado;
  }

  bool get realizado => _realizado;

  @override
  set id(int id) {
    _id = id;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'titulo': titulo,
      'descricao': descricao,
      //'data_prevista': Util.formatarDataParaBD(dataPrevista),
      'data_prevista': dataPrevista.toIso8601String(),
      'importante': importante ? 1 : 0,
      'realizado': realizado ? 1 : 0,
      // 'custo': custo ? (custo * 100).round() : 0,
      'custo': custo != null ? (custo! * 100).round() : 0,
    };
  }

  @override
  int? get id => _id;

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    /*var tarefa = Tarefa(
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String?,
      dataPrevista: DateTime.parse(map['data_prevista'] as String),
      importante: map['importante'] == 0 ? false : true,
      bool realizadoBD: map['realizado'] == 0 ? false : true,
      custo: (map['custo'] as int?) != null ? (map['custo'] as int) / 100 : null,
    ) : _realizado = realizadoBD;

    tarefa.id = map['id'] as int;*/

    // 1. Extraímos e tratamos os valores antes de criar a instância
    final int idDb = map['id'] as int;
    final bool realizadoDb = map['realizado'] == 1; // Simplificado: se for 1 é true
    final double? custoDb = map['custo'] != null ? (map['custo'] as int) / 100.0 : null;

    // 2. Criamos a instância passados os parâmetros corrigidos
    var tarefa = Tarefa(
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String?,
      dataPrevista: DateTime.parse(map['data_prevista'] as String),
      importante: map['importante'] == 1,
      realizadoBD: realizadoDb, // Passa diretamente para o construtor
      custo: custoDb,
    );

    // 3. Atribuímos o ID (supondo que você tenha um setter ou o campo não seja final)
    tarefa._id = idDb;
    return tarefa;
  }
}

/*
class ListaTarefas with ChangeNotifier {
  final List<Tarefa> tarefas = [
    Tarefa(titulo: "tarefa1", descricao: "descr_1", importante: true),
    Tarefa(titulo: "tarefa2", descricao: "descr_1", importante: false),
    Tarefa(titulo: "tarefa3", descricao: "descr_1", importante: true),
    Tarefa(titulo: "tarefa4", descricao: "descr_1", importante: false),
    Tarefa(titulo: "tarefa5", descricao: "descr_1", importante: true),
    Tarefa(titulo: "tarefa6", descricao: "descr_1", importante: false),
  ];
  void addTarefa(Tarefa tarefa) {
    tarefas.add(tarefa);
    print(tarefa.titulo);
    notifyListeners();
  }
}
*/
