import 'package:flutter/material.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomRangeCalendar extends StatefulWidget {
  final ReservationModel reservation;
  const CustomRangeCalendar({super.key, required this.reservation});

  @override
  State<CustomRangeCalendar> createState() => _CustomRangeCalendarState();
}

class _CustomRangeCalendarState extends State<CustomRangeCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  // Compute disabled dates based on reservation's disableFrom and disableTo
  Set<DateTime> get _disabledDates {
    final Set<DateTime> dates = {};

    // Add disabled dates from the reservation
    if (widget.reservation.disableFrom != null &&
        widget.reservation.disableTo != null) {
      DateTime current = widget.reservation.disableFrom!;
      while (!current.isAfter(widget.reservation.disableTo!)) {
        dates.add(_normalizeDate(current));
        current = current.add(const Duration(days: 1));
      }
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.now().subtract(const Duration(days: 365)),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: _calendarFormat,
          rangeSelectionMode: _rangeSelectionMode,
          enabledDayPredicate: (day) => !_isDateDisabled(day),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _rangeStart = null;
                _rangeEnd = null;
                _rangeSelectionMode = RangeSelectionMode.toggledOff;
              });
            }
          },
          onRangeSelected: _onRangeSelected,
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
          calendarStyle: CalendarStyle(
            // Disabled days styling
            disabledTextStyle: const TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
            rangeStartDecoration: const BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            rangeEndDecoration: const BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            rangeHighlightColor: Colors.deepOrange,
            withinRangeTextStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            // Today decoration
            todayDecoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            // Selected day decoration
            selectedDecoration: const BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            // Within range decoration
            withinRangeDecoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.3),
            ),
            // Weekend styling
            weekendTextStyle: const TextStyle(color: Colors.red),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
          ),
        ),
        if (_rangeStart != null && _rangeEnd != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Range: ${_rangeStart!.toString().split(' ')[0]} to ${_rangeEnd!.toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Print out disabled dates for debugging
    print('Disabled Dates: $_disabledDates');
    _rangeEnd = widget.reservation.checkOutDate;
    _rangeStart = widget.reservation.checkInDate;
  }

  bool _isDateDisabled(DateTime day) {
    // Normalize the day to compare only date components
    final normalizedDay = _normalizeDate(day);

    // Check if the day is in the disabled dates set
    final isDisabled =
        _disabledDates.any((disabledDate) => normalizedDay == disabledDate);

    // Optionally, also prevent selecting past dates
    final isPastDate = normalizedDay.isBefore(_normalizeDate(DateTime.now()));

    return isDisabled || isPastDate;
  }

  // Normalize date to remove time component
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    if (start == null || end == null) return;

    // Normalize start and end dates
    final normalizedStart = _normalizeDate(start);
    final normalizedEnd = _normalizeDate(end);

    // Check if the selected range includes any disabled dates
    final hasDisabledDates = _disabledDates.any((disabledDate) =>
        disabledDate
            .isAfter(normalizedStart.subtract(const Duration(days: 1))) &&
        disabledDate.isBefore(normalizedEnd.add(const Duration(days: 1))));

    if (hasDisabledDates) {
      // Show a snackbar if the range includes disabled dates
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Selected range includes blocked dates')));
      return;
    }

    setState(() {
      _rangeStart = start;
      _rangeEnd = end;
      _focusedDay = focusedDay;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }
}
