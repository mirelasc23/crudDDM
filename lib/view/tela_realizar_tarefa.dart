//import 'package:ddm_crud_sqlite/teste-sdp/cadastro.dart';
import 'package:ddm_crud_sqlite/model/tarefa.dart';
// import 'package:ddm_crud_sqlite/teste-sdp/database_helper.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Opcional: para formatar a data na tela

class RealizarTarefa extends StatefulWidget {
  @override
  _RealizarTarefaState createState() => _RealizarTarefaState(titulo: "Vizualizar Tarefa");
}

class _RealizarTarefaState extends State<RealizarTarefa> {
  final String titulo;
  _RealizarTarefaState({required this.titulo});

  var _estaRealizado = false;

  bool _concluirTarefa(Tarefa tarefa){
    tarefa.estaRealizado(!tarefa.realizado);
    setState(() => _estaRealizado = tarefa.realizado);
    //setState(() => _estaRealizado = value == true);
    return tarefa.realizado;
  }
  
  @override
  Widget build(BuildContext context) {
    //! programador garante que nao sera nulo, pois tem uma rota associada
    Tarefa tarefa = ModalRoute.of(context)?.settings.arguments as Tarefa;
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: /*Center(
        child: */Column(
          // mainAxisAlignment: .center,
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 20),
            Text("Id: ${tarefa.id}  |   Título: ${tarefa.titulo}", style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("Descrição: ${tarefa.descricao}", style: TextStyle(fontSize: 20)),
            Text("Data: ${Util.formatarDataParaBDLocalization(tarefa.dataPrevista)}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text("Está realizada?"),
              // value: _estaRealizado,
              value: tarefa.realizado,
              onChanged: (bool? value) =>//()
                  //setState(() => _estaRealizado = value == true),
                  value = _concluirTarefa(tarefa),
                  //tarefa.realizado
            ),
          ],
        ),
      //),
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