import 'package:ddm_crud_sqlite/model/tarefa.dart';
import 'package:ddm_crud_sqlite/util/db.dart';
import 'package:flutter/material.dart';

class TarefaProvider with ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefasDummy {
    _tarefas = [
      Tarefa(titulo: "Maria", estaFeliz: true),
      Tarefa(titulo: "João", estaFeliz: false),
      Tarefa(titulo: "Ana", estaFeliz: true),
      Tarefa(titulo: "Carlos", estaFeliz: false),
      Tarefa(titulo: "Sofia", estaFeliz: true),
      Tarefa(titulo: "Juarez", estaFeliz: true),
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

    DBUtil.insert(tarefa);
  void addTarefa(Tarefa tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  void removeTarefa(int id) {
    DBUtil.delete("Tarefa", id);
    _tarefas.removeWhere((pessoa) => pessoa.id == id);
    notifyListeners();
  }
}
