import 'package:flutter/material.dart';

/// Flutter code sample for basic [showDatePicker].

void main() => runApp(const DatePickerApp(titulo: "tit"));

class DatePickerApp extends StatelessWidget {
  final String titulo;
  const DatePickerApp({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('showDatePicker Example')),
        body: const Center(child: DatePickerExample()),
      );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //firstDate: DateTime(DateTime.now().year),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
      locale: Locale('pt', 'BR')
    );

    setState(() {
      selectedDate = pickedDate;
    });

    // DateTime get selectedDate => _selectDate();
  }

  /*@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        OutlinedButton(
          onPressed: _selectDate,
          child: const Text('Select Date'),
        ),
      ],
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _selectDate, 
      child: const Icon(Icons.calendar_month),
      );
  }
}

// ignore: must_be_immutable
class Calendario extends StatelessWidget{
  // final Function _clickBotao;
  // final String _texto;
  DateTime? selectedDate;
  
  Calendario({super.key});

  void setState(DateTime pickedDate) {
    selectedDate = pickedDate;
  }
  
  

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //firstDate: DateTime(DateTime.now().year),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
      //locale: Locale('pt', 'BR')
    );

    setState(pickedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 81, 146),
        elevation: 2
      ),
      onPressed: ()=> _selectDate(context), 
      child: Text('Select Date', style: TextStyle(
          fontSize: 20, 
          color: Colors.amber[50]
        )
      )
    );
  }
  
}
