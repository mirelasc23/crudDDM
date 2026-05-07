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
      'custo': custo ? (custo * 100).round() : 0,
    };
  }

  @override
  int? get id => _id;

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    var tarefa = Tarefa(
      descricao: map['nome'] as String,
      importante: map['importante'] == 0 ? false : true,
    );
    tarefa.id = map['id'] as int;
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
