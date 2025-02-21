import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final String? title;
  const DatePickerWidget({super.key, this.title});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: _selectDate,
          child: Text(
            widget.title??
            'Chọn ngày'
            ),
        ),
      ],
    );
  }
}

