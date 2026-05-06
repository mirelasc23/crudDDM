import 'package:flutter/material.dart';

class Tarefa {
  final int id;
  final String titulo;
  final String descricao;
  final int prioridade;
  bool _realizado;

  Tarefa({
    required this.titulo,
    required this.descricao,
    required this.prioridade,
    dynamic estaRealizado = false,
    required this.id,
  });
  //Tarefa({required this.titulo, required this.descricao, required this.prioridade, dynamic estaRealizado=false, required this.id});

  void estaRealizado(bool realizado) {
    this._realizado = realizado;
  }

  bool realizado() {
    return this._realizado;
  }
}

class ListaTarefas with ChangeNotifier {
  final List<Tarefa> Tarefas = [
    Tarefa(
      titulo: "tarefa1",
      descricao: "descr_1",
      prioridade: 1,
      estaRealizado: false,
      id: 1,
    ),
    Tarefa(
      titulo: "tarefa2",
      descricao: "descr_1",
      prioridade: 3,
      estaRealizado: false,
      id: 2,
    ),
    Tarefa(
      titulo: "tarefa3",
      descricao: "descr_1",
      prioridade: 4,
      estaRealizado: false,
      id: 3,
    ),
    Tarefa(
      titulo: "tarefa4",
      descricao: "descr_1",
      prioridade: 5,
      estaRealizado: false,
      id: 4,
    ),
    Tarefa(
      titulo: "tarefa5",
      descricao: "descr_1",
      prioridade: 2,
      estaRealizado: false,
      id: 5,
    ),
    Tarefa(
      titulo: "tarefa6",
      descricao: "descr_1",
      prioridade: 2,
      estaRealizado: false,
      id: 6,
    ),
  ];
  void addTarefa(Tarefa tarefa) {
    tarefas.add(tarefa);
    print(tarefa.titulo);
    notifyListeners();
  }
}
