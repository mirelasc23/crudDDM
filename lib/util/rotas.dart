import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Rotas {
  static final telaInicial = "/";
  static final telaLista = "/tela_listagem";
  static final telaForm = "/tela_formulario";
  static final telaCadastro = "/tela_cadastro";
  static final tarefaDetalhada = "/tarefa-detalhada";
  static final tarefaAConcluir = "/tarefa-concluir";
}

class Util {
  Util._();

  static String formatarDataParaBD(DateTime data) {
    return DateFormat('yyyy-MM-dd').format(data);
  }

  static String formatarDataParaBDLocalization(DateTime data) {
    initializeDateFormatting('pt_BR', null);
    return DateFormat.yMd('pt_BR').format(data);
  }
}
