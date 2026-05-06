import '../model/tarefa.dart';
import 'package:flutter/material.dart';

class TelaDetalhes extends StatelessWidget {
  final String titulo;

  const TelaDetalhes({super.key, required this.titulo});

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
            Text("tela DETALHES", style: TextStyle(fontSize: 24)),
            Text(
              "titulo: ${tarefa.titulo} está ${tarefa.realizado ? "REALIZADO! :)" : "... pendente :("}",
              style: TextStyle(fontSize: 18),
            ),
            /*CheckboxListTile(
              title: Text("você esta feliz?"),
              value: tarefa.realizado,
              //onChanged: (bool? value) => setState(() => tarefa.realizado = value==true),
            ),*/
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
