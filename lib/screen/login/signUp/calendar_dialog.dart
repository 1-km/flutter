import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarDialog extends StatelessWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarDialog({
    required this.initialDate,
    required this.onDateSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DateTime?> selectedDate = [initialDate];

    return Stack(
      children: [
        Positioned(
          bottom: 100, // 화면 아래에서 위로 여백
          left: MediaQuery.of(context).size.width * 0.05, // 왼쪽에서 5% 여백
          right: MediaQuery.of(context).size.width * 0.05, // 오른쪽에서 5% 여백
          child: Material(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      selectedDayHighlightColor: const Color(0xFF007AFF),
                      weekdayLabels: [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat'
                      ],
                      weekdayLabelTextStyle: TextStyle(
                        color: const Color(0xFF3C3C43).withOpacity(0.3),
                        fontWeight: FontWeight.bold,
                      ),
                      firstDayOfWeek: 1,
                      controlsHeight: 50,
                      controlsTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      dayTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      todayTextStyle: const TextStyle(
                        color: Color(0xFF007AFF),
                        fontWeight: FontWeight.bold,
                      ),
                      disabledDayTextStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    value: selectedDate,
                    onValueChanged: (dates) {
                      if (dates.isNotEmpty) {
                        onDateSelected(dates[0]);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
