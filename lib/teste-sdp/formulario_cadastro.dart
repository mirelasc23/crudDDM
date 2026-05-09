//import 'package:ddm_crud_sqlite/teste-sdp/cadastro.dart';
import 'package:ddm_crud_sqlite/teste-sdp/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Opcional: para formatar a data na tela

class FormularioCadastro extends StatefulWidget {
  @override
  _FormularioCadastroState createState() => _FormularioCadastroState();
}

class _FormularioCadastroState extends State<FormularioCadastro> {
  final _nomeController = TextEditingController();
  DateTime? _dataSelecionada;

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
    if (_nomeController.text.isEmpty || _dataSelecionada == null) return;

    // 1. Gera o Objeto
/*    final novoCadastro = Cadastro(
      nome: _nomeController.text,
      data: _dataSelecionada!,
    );

    // 2. Salva no SQLite
    await DatabaseHelper.insertCadastro(novoCadastro);*/

    

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Salvo com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
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
          ],
        ),
      ),
    );
  }
}