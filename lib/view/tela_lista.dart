//import 'package:ddm_exercicio02_formulario__em_telas/lib-exercicio_02_formulario/checkbox.dart';

import 'package:ddm_crud_sqlite/providers/tarefa_provider.dart';

import '../model/tarefa.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLista extends StatelessWidget {
  final String titulo;

  TelaLista({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final List<Tarefa> tarefas = Provider.of<TarefaProvider>(context).tarefas;
    final colors = Theme.of(context).colorScheme;
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
            // color: const Color.fromARGB(255, 231, 191, 59),
            color: colors.inversePrimary.withOpacity(0.05),
            child: ListTile(
              title: Text(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tarefa.titulo,
              ),
              leading: Text("${tarefa.id}"),
              //subtitle: ShowDatePicker(tarefa.dataPrevista as Date),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context, 
                    Rotas.telaCadastro,
                    arguments: tarefa
                  );
                }, icon: Icon(Icons.edit)),
              //tileColor: tarefa.estaFeliz ? Colors.green[300] : Colors.red[300] ,
              //subtitle: Text(tarefa.estaFeliz ? "Está feliz :)" : "Está triste :("),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  //Rotas.tarefaDetalhada,
                  Rotas.tarefaAConcluir,
                  arguments: tarefa,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, Rotas.telaForm);
          Navigator.pushNamed(context, Rotas.telaCadastro);
        },
        tooltip: 'adicionar tarefa',
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
