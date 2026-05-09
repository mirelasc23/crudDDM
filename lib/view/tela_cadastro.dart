import 'package:ddm_crud_sqlite/model/tarefa.dart';
import 'package:ddm_crud_sqlite/providers/tarefa_provider.dart';
// import 'package:ddm_crud_sqlite/teste-sdp/database_helper.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; // Opcional: para formatar a data na tela

class FormularioTarefa extends StatefulWidget {
  @override
  _FormularioTarefaState createState() => _FormularioTarefaState();
}

class _FormularioTarefaState extends State<FormularioTarefa> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _custoController = TextEditingController();
  //Tarefa? _tarefa;

  DateTime? _dataSelecionada;
  //var _estaRealizado = false;
  var _eImportante = false;
  //var _dadosSalvos = false;

  // Função para abrir o seletor de data
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? escolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (escolhida != null && escolhida != _dataSelecionada) {
      setState(() {
        _dataSelecionada = escolhida;
      });
    }

    
  }

  void _salvar() async {
    if (_tituloController.text.isEmpty || _dataSelecionada == null) return;
    double valorFinal = double.tryParse(_custoController.text) ?? 0.0;

    // 1. Gera o Objeto
    final novaTarefa = Tarefa.completa(
      titulo: _tituloController.text,
      descricao: _descricaoController.text,
      custo: valorFinal,
      dataPrevista: _dataSelecionada!, importante: _eImportante,
    );

    // 2. Salva no SQLite
    //await DatabaseHelper.insertTarefa(novaTarefa);
    final listaTarefas = Provider.of<TarefaProvider>(context, listen: false);
    print("Tarefa:${novaTarefa.titulo}");
    listaTarefas.addTarefa(novaTarefa);


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Salvo com sucesso!')),
    );

    Navigator.pushNamed(context, Rotas.telaLista);

    /*if (_dadosSalvos) {
      Navigator.pushNamed(context, Rotas.telaLista);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    Tarefa tarefa = ModalRoute.of(context)?.settings.arguments as Tarefa;
    return Scaffold(
      appBar: AppBar(title: Text("Tarefa")),
      body: Padding(//Center(//
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _custoController,
              decoration: InputDecoration(
                labelText: 'Custo',
                prefixText: 'R\$ '
              ),
              // onChanged: (value) {
                
              // },
            ),
            CheckboxListTile(
              title: Text("É importante?"),
              value: _eImportante,
              onChanged: (bool? value) =>
                  setState(() => _eImportante = value == true),
            ),
            /*CheckboxListTile(
              title: Text("Está realizada?"),
              value: _estaRealizado,
              onChanged: (bool? value) =>
                  setState(() => _estaRealizado = value == true),
            ),*/
            SizedBox(height: 20),
            Row(
              children: [
                Text(_dataSelecionada == null 
                    ? 'Nenhuma data selecionada' 
                    : 'Data: ${DateFormat('dd/MM/yyyy').format(_dataSelecionada!)}'),
                Spacer(),
                TextButton(
                  onPressed: () => _selecionarData(context),
                  child: Text('Selecionar Data'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _salvar,
              child: Text('Salvar no Banco'),
            ),
            /*ElevatedButton(
              onPressed: _mostraDados,
              child: const Icon(Icons.done_outline_outlined),
            ),*/
          ],
        ),
      ),
    );
  }
}