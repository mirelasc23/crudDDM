import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
      //locale: const Locale('pt', 'BR'),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      print("Data selecionada: $selectedDate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 81, 146),
        elevation: 2,
      ),
      onPressed: () => _selectDate(context),
      child: Text(
        selectedDate == null 
          ? 'Selecionar Data' 
          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
        style: TextStyle(fontSize: 20, color: Colors.amber[50]),
      ),
    );
  }
}