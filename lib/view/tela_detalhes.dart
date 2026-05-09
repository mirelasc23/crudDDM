import 'package:ddm_crud_sqlite/util/rotas.dart';

import '../model/tarefa.dart';
import 'package:flutter/material.dart';

class TelaDetalhes extends StatelessWidget {
  final String titulo;

  const TelaDetalhes({super.key, required this.titulo});

  bool _concluirTarefa(Tarefa tarefa){
    tarefa.estaRealizado(!tarefa.realizado);
    return tarefa.realizado;
  }

  @override
  Widget build(BuildContext context) {
    //! programador garante que nao sera nulo, pois tem uma rota associada
    Tarefa tarefa = ModalRoute.of(context)?.settings.arguments as Tarefa;
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Id: ${tarefa.id}  |   Título: ${tarefa.titulo}", style: TextStyle(fontSize: 24)),
            Text("Descrição: ${tarefa.descricao}", style: TextStyle(fontSize: 20)),
            Text("Data: ${Util.formatarDataParaBDLocalization(tarefa.dataPrevista)}", style: TextStyle(fontSize: 20)),
            Text(
              " ${tarefa.importante ? "É prioridade!" : ""}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              " ${tarefa.realizado ? "Concluído! :)" : "Está pendente... :("}",
              style: TextStyle(fontSize: 18),
            ),
            /*CheckboxListTile(
              title: Text("você esta feliz?"),
              value: tarefa.realizado,
              //onChanged: (bool? value) => setState(() => tarefa.realizado = value==true),
            ),*/
            CheckboxListTile(
              title: Text("Está realizada?"),
              value: tarefa.realizado,
              onChanged: (bool? value) =>//()
                  value = _concluirTarefa(tarefa),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'voltar',
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}
