import 'package:ddm_crud_sqlite/util/rotas.dart';
import 'package:ddm_crud_sqlite/view/telaDetalhes.dart';
import 'package:ddm_crud_sqlite/view/telaForm.dart';
import 'package:ddm_crud_sqlite/view/telaLista.dart';
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
        routes: {
          Rotas.telaForm: (context) => TelaForm(titulo: 'Nova Tarefa'),
          Rotas.tarefaDetalhada: (context) => TelaDetalhes(titulo: 'Tarefa'),
        },
      ),
    );
  }
}
