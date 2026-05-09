import 'package:ddm_crud_sqlite/providers/tarefa_provider.dart';
//import 'package:ddm_crud_sqlite/teste-sdp/formulario_cadastro.dart';
import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:ddm_crud_sqlite/view/tela_cadastro.dart';
import 'package:ddm_crud_sqlite/view/tela_detalhes.dart';
import 'package:ddm_crud_sqlite/view/tela_form.dart';
import 'package:ddm_crud_sqlite/view/tela_lista.dart';
import 'package:ddm_crud_sqlite/view/tela_realizar_tarefa.dart';
// import 'package:ddm_crud_sqlite/widgets/show_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        ),
        home: TelaLista(titulo: 'Tarefas'),
        // home: DatePickerApp(titulo: 'tit'),
        routes: {
          Rotas.telaForm: (context) => TelaLista(titulo: 'Tarefas'),
          Rotas.telaForm: (context) => TelaForm(titulo: 'Nova Tarefa'),
          Rotas.telaCadastro: (context) => FormularioTarefa(),
          Rotas.tarefaDetalhada: (context) => TelaDetalhes(titulo: 'Tarefa'),
          Rotas.tarefaAConcluir: (context) => RealizarTarefa(),
        },
      ),
    );
  }
}
