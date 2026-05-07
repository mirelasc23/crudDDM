import 'package:ddm_crud_sqlite/model/model.dart';
import 'package:flutter/material.dart';

class Tarefa implements Model {
  final int id;
  final String titulo;
  final String descricao;
  final int prioridade;
  bool _realizado;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.prioridade,
    bool realizadoInicial = false,

    //dynamic estaRealizado({realizado: false}),// = false,
    //this._realizado = estaRealizado,
  }) : _realizado = realizadoInicial;
  //Tarefa({required this.titulo, required this.descricao, required this.prioridade, dynamic estaRealizado=false, required this.id});

  void estaRealizado({bool realizado = false}) {
    this._realizado = realizado;
  }

  bool realizado() {
    return this._realizado;
  }

  @override
  set id(int id) {
    this.id = id;
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

class ListaTarefas with ChangeNotifier {
  final List<Tarefa> tarefas = [
    Tarefa(
      titulo: "tarefa1",
      descricao: "descr_1",
      prioridade: 1,
      //estaRealizado: false,
      id: 1,
    ),
    Tarefa(
      titulo: "tarefa2",
      descricao: "descr_1",
      prioridade: 3,
      //estaRealizado: false,
      id: 2,
    ),
    Tarefa(
      titulo: "tarefa3",
      descricao: "descr_1",
      prioridade: 4,
      //estaRealizado: false,
      id: 3,
    ),
    Tarefa(
      titulo: "tarefa4",
      descricao: "descr_1",
      prioridade: 5,
      //estaRealizado: false,
      id: 4,
    ),
    Tarefa(
      titulo: "tarefa5",
      descricao: "descr_1",
      prioridade: 2,
      //estaRealizado: false,
      id: 5,
    ),
    Tarefa(
      titulo: "tarefa6",
      descricao: "descr_1",
      prioridade: 2,
      //estaRealizado: false,
      id: 6,
    ),
  ];
  void addTarefa(Tarefa tarefa) {
    tarefas.add(tarefa);
    print(tarefa.titulo);
    notifyListeners();
  }
}
