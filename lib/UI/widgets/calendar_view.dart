import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          calendarBuilders:
              CalendarBuilders(headerTitleBuilder: (context, focusedDay) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical :8.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.yMMMM()
                        .format(focusedDay), // Display the formatted month
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: cardStyle.copyWith(
                            borderRadius: BorderRadius.circular(40)),
                        child: GestureDetector(
                          child: Icon(Icons.chevron_left, color: Colors.blue),
                          onTap: () {
                            setState(() {
                              _focusedDay = DateTime.utc(
                                focusedDay.year,
                                focusedDay.month - 1,
                                focusedDay.day,
                              );
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: cardStyle.copyWith(
                            borderRadius: BorderRadius.circular(40)),
                        child: GestureDetector(
                          child: Icon(Icons.chevron_right, color: Colors.blue,),
                          onTap: () {
                            setState(() {
                              _focusedDay = DateTime.utc(
                                focusedDay.year,
                                focusedDay.month + 1,
                                focusedDay.day,
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          calendarFormat: CalendarFormat.month,
          availableCalendarFormats: {CalendarFormat.month: ''},
          firstDay: DateTime.utc(2020, 01, 01),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          calendarStyle: CalendarStyle(
              markersAutoAligned: false,
              weekendTextStyle: mediumThin.copyWith(
                  color:
                      Color.fromARGB(255, 110, 110, 110)), // Highlight weekends
              outsideDaysVisible: false, // Show days of other months
              outsideTextStyle: const TextStyle(
                  color: Color.fromARGB(0, 184, 184,
                      184)), // Light color for days of other months
              selectedDecoration: const BoxDecoration(
                color: Colors.blue, // Change the accent color here
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blue
                    .withOpacity(0.2), // Change the accent color here
                shape: BoxShape.circle,
              ),
              defaultTextStyle: mediumBold),
          headerStyle: HeaderStyle(
              titleTextStyle: largeBold, // Bold headings
              leftChevronVisible: false,
              rightChevronVisible: false),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: smallBold,
            weekendStyle: smallThin, // Bold weekends
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay =
                  focusedDay; // Update focused day for visual continuity
            });
          },
        )
      ],
    );
  }
}
