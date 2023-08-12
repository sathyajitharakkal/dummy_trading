import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Widget> buildWeekdays() {
  return List.generate(7, (index) {
    return Center(
      child: Text(
        DateFormat.E().format(DateTime(2023, 1, index + 1)),
        style: index == 0 || index == 6
            ? smallSemiBold.copyWith(color: const Color.fromARGB(255, 110, 110, 110))
            : smallBold,
      ),
    );
  });
}