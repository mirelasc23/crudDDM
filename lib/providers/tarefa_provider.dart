import 'package:ddm_crud_sqlite/model/tarefa.dart';
import 'package:ddm_crud_sqlite/util/db.dart';
import 'package:flutter/material.dart';

class TarefaProvider with ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefasDummy {
    _tarefas = [
      Tarefa(
        titulo: "Tarefa DDM",
        importante: true,
        dataPrevista: DateTime.now(),
      ),
      Tarefa(
        titulo: "Trabalho DDM",
        importante: false,
        dataPrevista: DateTime.now().add(Duration(days: 1)),
      ),
      Tarefa(
        titulo: "Introdução TCCI",
        importante: true,
        dataPrevista: DateTime.now().add(Duration(days: 3)),
      ),
      Tarefa(
        titulo: "Apresentação Parcial WEBII",
        importante: false,
        dataPrevista: DateTime.now().add(Duration(days: 3)),
      ),
      Tarefa(
        titulo: "Apresentação Final PSII",
        importante: true,
        dataPrevista: DateTime.now().add(Duration(days: 3)),
      ),
      Tarefa(
        titulo: "Reunião Orientador TCCI",
        importante: true,
        dataPrevista: DateTime.now().add(Duration(days: 3)),
      ),
    ];
    return _tarefas;
  }

  List<Tarefa> get tarefas => _tarefas;

  Future<void> carregaTarefas() async {
    _tarefas = await DBUtil.list("Tarefa").then(
      (res) => _tarefas = res.map((mapa) => Tarefa.fromMap(mapa)).toList(),
    );
    notifyListeners();
  }

  void addTarefa(Tarefa tarefa) {
    DBUtil.insert(tarefa);
    _tarefas.add(tarefa);
    notifyListeners();
  }

  void removeTarefa(int id) {
    DBUtil.delete("Tarefa", id);
    _tarefas.removeWhere((pessoa) => pessoa.id == id);
    notifyListeners();
  }
}
