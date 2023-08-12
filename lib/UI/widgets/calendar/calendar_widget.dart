import 'package:dummy_trading/UI/widgets/calendar/calendar_days_layout.dart';
import 'package:dummy_trading/UI/widgets/calendar/calendar_weekday.dart';
import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDate = DateTime.now();
  DateTime _highlightedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month - 1, _selectedDate.day);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month + 1, _selectedDate.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMM()
                    .format(_selectedDate), // Display the formatted month
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: cardStyle.copyWith(
                        borderRadius: BorderRadius.circular(40)),
                    child: GestureDetector(
                        child: Icon(Icons.chevron_left, color: Colors.blue),
                        onTap: _previousMonth),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: cardStyle.copyWith(
                        borderRadius: BorderRadius.circular(40)),
                    child: GestureDetector(
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.blue,
                        ),
                        onTap: _nextMonth),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildWeekdays()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
              children: buildCalendarDays(
            _selectedDate,
            _highlightedDate,
            onDaySelected: (DateTime day) {
              _highlightedDate = day;
              setState(() {});
            },
          )),
        ),
      ],
    );
  }
}