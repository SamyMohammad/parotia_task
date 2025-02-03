// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  final kToday = DateTime.now();

  late final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
  late final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TableCalendar(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          // calendarBuilders: CalendarBuilders(
          //     selectedBuilder: (context, date, _) => Container(
          //             decoration: const BoxDecoration(
          //           color: Colors.orange,
          //         ))),
          calendarFormat: _calendarFormat,
          calendarStyle: const CalendarStyle(
              rangeStartDecoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.orange,
                // shape: BoxShape.circle,
              ),
              rangeEndTextStyle: TextStyle(color: Colors.black),
              rangeStartTextStyle: TextStyle(color: Colors.black),
              // selectedDecoration: BoxDecoration(
              //   // borderRadius: BorderRadius.all(Radius.circular(8)),
              //   color: Colors.orange,
              //   shape: BoxShape.rectangle,
              // ),
              rangeHighlightColor: Colors.orange,
              rangeHighlightScale: 1.1,
              // rangeStartDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(8)),
              //   color: Colors.orange,
              // ),
              rangeEndDecoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.orange,
                shape: BoxShape.rectangle,
              ),
              withinRangeDecoration: BoxDecoration(
                color: Colors.orange,
              )),
          rangeSelectionMode: _rangeSelectionMode,
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _rangeStart = null; // Important to clean those
                _rangeEnd = null;
                _rangeSelectionMode = RangeSelectionMode.toggledOff;
              });
            }
          },
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              _selectedDay = null;
              _focusedDay = focusedDay;
              _rangeStart = start;
              _rangeEnd = end;
              _rangeSelectionMode = RangeSelectionMode.toggledOn;
            });
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ));
  }
}
