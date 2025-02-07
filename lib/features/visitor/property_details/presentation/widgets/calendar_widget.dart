import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  CalendarWidgetState createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(2022, 3);
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  // Getter methods to access current calendar state
  DateTime get focusedDay => _focusedDay;

  DateTime? get rangeEnd => _rangeEnd;

  DateTime? get rangeStart => _rangeStart;
  DateTime? get selectedDay => _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2023, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: true,
          weekendTextStyle: TextStyle(color: Colors.red),
          holidayTextStyle: TextStyle(color: Colors.red),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }

  // Method to reset or update calendar state externally if needed
  void updateCalendar({
    DateTime? selectedDay,
    DateTime? focusedDay,
    DateTime? rangeStart,
    DateTime? rangeEnd,
  }) {
    setState(() {
      if (selectedDay != null) _selectedDay = selectedDay;
      if (focusedDay != null) _focusedDay = focusedDay;
      if (rangeStart != null) _rangeStart = rangeStart;
      if (rangeEnd != null) _rangeEnd = rangeEnd;
    });
  }
}
