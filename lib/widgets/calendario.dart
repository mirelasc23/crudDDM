import 'package:flutter/material.dart';

class Calendario extends StatelessWidget {
  // Callback que enviará a data para o widget pai
  final Function(DateTime) onDateSelected;

  const Calendario({super.key, required this.onDateSelected});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
      //locale: const Locale('pt', 'BR'),
    );

    // Se o usuário não cancelou, enviamos a data de volta
    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 81, 146),
        //backgroundColor: const Color.fromARGB(255, 2, 81, 146),
      ),
      onPressed: () => _selectDate(context),
      child: const Text(
        'Selecionar Data',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
