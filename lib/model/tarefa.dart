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
    //bool realizadoInicial = false,
  }) : _realizado = false;

  void estaRealizado({bool realizado = false}) {
    this._realizado = realizado;
  }

  /*bool realizado() {
    return this._realizado;
  }*/
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
      'data_prevista': Util.formatarDataParaBD(dataPrevista),
      'importante': importante ? 1 : 0,
      'realizado': realizado ? 1 : 0,
    };
  }

  @override
  int? get id => _id;
}

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
