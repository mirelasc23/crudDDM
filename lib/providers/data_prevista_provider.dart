//import 'package:ddm_crud_sqlite/model/tarefa.dart';
//import 'package:ddm_crud_sqlite/util/db.dart';
import 'package:flutter/material.dart';

class DataPrevistaProvider with ChangeNotifier {
  DateTime _dataPrevista = DateTime.now();

  DateTime get dataPrevista => _dataPrevista;

  void setDataPrevista(DateTime dataPrevista) {
    _dataPrevista = dataPrevista;
    notifyListeners();
  }
}
