import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarPicker extends StatefulWidget {
  const CalendarPicker({super.key});

  @override
  State<CalendarPicker> createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  List<DateTime?> _dates = [];
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn ngày'),
      ),
      body: Center(
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.multi,
          ),
          value: _dates,
          onValueChanged: (dates) {
            setState(() {
              _dates = dates;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, _date); // Trả lại giá trị ngày được chọn
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
