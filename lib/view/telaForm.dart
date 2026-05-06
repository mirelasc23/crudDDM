import '../model/tarefa.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaForm extends StatefulWidget {
  final String titulo;

  const TelaForm({super.key, required this.titulo});

  @override
  State<TelaForm> createState() => _TelaFormState();
}

class _TelaFormState extends State<TelaForm> {
  var _dadosSalvos = false;
  var _estaRealizado = false;
  Tarefa? _tarefa;
  final _nomeController = TextEditingController();

  void _mostraDados() {
    setState(() {
      _tarefa = Tarefa(
        titulo: "tarefa1",
        descricao: "descr_1",
        prioridade: 1,
        estaRealizado: _tarefa?.realizado(),
        id: 1,
        /*estaFeliz:  _estaRealizado,
          nome:  _nomeController.text*/
      );
      _dadosSalvos = _tarefa?.titulo != "";
    });
  }

  void _trocaTela() {
    if (_tarefa != null) {
      final listaTarefas = Provider.of<ListaTarefas>(context, listen: false);
      print("Tarefa:${_tarefa!.titulo}");
      listaTarefas.addTarefa(_tarefa!);

      if (_dadosSalvos) {
        Navigator.pushNamed(context, Rotas.telaLista);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(_dadosSalvos ? "Dados gravados" : "Nenhum dado salvo!"),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: "Informe o título",
                border: OutlineInputBorder(),
              ),
            ),
            CheckboxListTile(
              title: Text("você esta feliz?"),
              value: _estaRealizado,
              onChanged: (bool? value) =>
                  setState(() => _estaRealizado = value == true),
            ),
            ElevatedButton(
              onPressed: _mostraDados,
              child: const Icon(Icons.done_outline_outlined),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _trocaTela,
        tooltip: 'enviar',
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}
