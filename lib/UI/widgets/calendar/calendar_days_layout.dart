import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';

List<Widget> buildCalendarDays(
  DateTime selected,
  DateTime highlight, {
  Function(DateTime)? onDaySelected,
}) {
  final daysInMonth = DateTime(selected.year, selected.month + 1, 0).day;
  final firstDayOfWeek = DateTime(selected.year, selected.month, 1).weekday;

  List<Widget> days = [];
  int dayCounter = 1;

  for (int i = 0; i < 6; i++) {
    List<Widget> rowChildren = [];

    for (int j = 0; j < 7; j++) {
      if ((i == 0 && j < firstDayOfWeek) || dayCounter > daysInMonth) {
        rowChildren.add(Expanded(child: Container()));
      } else {
        var currentDate = DateTime(selected.year, selected.month, dayCounter);

        rowChildren.add(
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onDaySelected != null) onDaySelected(currentDate);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: highlight == currentDate ? 45 : null,
                    width: highlight == currentDate ? 45 : null,
                    decoration: highlight == currentDate
                        ? cardStyle.copyWith(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue)
                        : null,
                    child: Center(
                      child: Text(
                        '$dayCounter',
                        style: highlight == currentDate ? smallSemiBold.copyWith(color: Colors.white) : (j == 0 || j == 6 ? smallThin : mediumSemiBold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        dayCounter++;
      }
    }

    days.add(SizedBox(
      height: 50,
      child: Center(child: Row(children: rowChildren)),
    ));
  }

  return days;
}
