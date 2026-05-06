//import 'package:ddm_exercicio02_formulario__em_telas/lib-exercicio_02_formulario/checkbox.dart';

import '../model/tarefa.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLista extends StatelessWidget {
  final String titulo;

  TelaLista({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final List<Tarefa> tarefas = Provider.of<ListaTarefas>(context).tarefas;
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = tarefas[index];
          return Card(
            elevation: 3,
            color: Colors.lightBlue[200],
            child: ListTile(
              title: Text(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tarefa.titulo,
              ),
              leading: Text("${tarefa.id}"),
              subtitle: Text(tarefa.descricao),
              trailing: Text(tarefa.realizado ? "Realizado" : "Pendente"),
              //tileColor: tarefa.estaFeliz ? Colors.green[300] : Colors.red[300] ,
              //subtitle: Text(tarefa.estaFeliz ? "Está feliz :)" : "Está triste :("),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Rotas.tarefaDetalhada,
                  arguments: tarefa,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Rotas.telaForm);
        },
        tooltip: 'adicionar tarefa',
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
